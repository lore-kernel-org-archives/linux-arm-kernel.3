Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557BDC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8kpEDihnr+M8TdP16ky008+U5/0wXpkYZQ8ZAiWRp4=; b=jtPzzggmHuS+GH+DF7zumaxz6z
	PrxPiY7F4SeCxWX6hf9KPrrbq/nnj3tUBSEoYpMs9nfDmYEZpoEEkkAG2aaoVcCwMYdWrvfVFYz9k
	0DNkC/MK/bZAoSRzr1MoIAnC7fJ7S2xTj1SvOljHgr5w1ktqJUlV0TkADz+daXeGqBAb+UxQIIvCT
	GRqJwwKlYkPYDtj/EFdnqejjfaBAxHRRPytBpbDNBM0dF2wWoT4ommUz9kdcE4CI+88k21PVLE2Ot
	vp/LAcFhlWywUp6glX0nP3ADyraQs3024WU7kkvsCzlsduG9yLhJ8syGRmdgDoYNVqkfdyDn58Gm1
	1rhnwEMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9L7G-0000000840g-1JDk;
	Wed, 23 Sep 2026 11:26:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9L6y-000000083xI-41mg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:26:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3Cr22262096
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A8kpEDihnr+M8TdP16ky008+U5/0wXpkYZQ8ZAiWRp4=; b=LDCAF+6PYMGDa1hX
	CZho+8P+RdrJLHQuAcRrSndkxfxHFu1MLaYZ4ZtNGpefNEW2/EHpm7u/aiG1C5SW
	g9HQyleQkbgaCGn7QyLaBjkT4R8G5IvcDCrR2Iuu5Cpy4UudLkXDRqBME2QJBUFe
	6rEIMlxmoSPQROr7w/vbCMH6MBybl5F6VUD+S+9KexpQvBwk4QTVqsNgyLJe+qko
	qFLuIMUD7PGiQiPFMN2pkJx6gabdI8y/+Fo9Xi7ERomhni4pYEGVu+K9GIMHRiE+
	v2ubZn/1ta1ZY/f4UKEEBBIkJOKZ8RhOs7gwfnqrzTGn7jz8h74446AOOG1CnFAk
	EEigjg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c3rdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:26:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9393ac4961fso109728385a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790162763; x=1790767563; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A8kpEDihnr+M8TdP16ky008+U5/0wXpkYZQ8ZAiWRp4=;
        b=MOdvM4SHzniG2x0/WK6ahfEMKEJWvyyRa6Ia7yC2+VMhQIBfCO3cGGoKReK/aZQIa0
         Ar6gSOUaYxYzepe5ywnWHvf3db7Rjb5RjaptW/Et/YIVh/WuZ5ZYBiWcdAFnDFa+u+o8
         UFpzi8v3GvwOfY4+1Bq4BG9QcgCLm0VcE4tTqY+xO0gCc/R6zkLsMHBmqsHZ0dIkD3wi
         7BFX0MVc4BN+1uEU1PJuPuqR84jurA4e2n3Mg+dPRLgP6RF1KaE8yt+YVRouDRPf05qf
         5wD7bBnuW/oCnLowxpX5NTV0yb4WbWZi1xCjVqVC19VNbpCMP3Xpq6wnDizgpmW9ck4D
         cMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162763; x=1790767563;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8kpEDihnr+M8TdP16ky008+U5/0wXpkYZQ8ZAiWRp4=;
        b=akgaeejCMl7yyQkk2AoelE5KLoWdNn1AMHLQMvC9Zaf/kAgSTJ7c9SEVH8nydxRDWU
         WPHKK+yVF6T7oV6FRrSluccLEj1p97mnvxXKTgEeheq9UdkAND7J+I9607ULTPLKSx54
         KJfsQprizIYYjh1YmJ741uutnKcK0fQZGqqmZNqad+Kb6gLn9n39DkvOxoCLy1Xydnll
         K7XN7IEH19kg7dfTf6C5W5ZcNus6gDvBzCbGnVmngm8wh+rJFmal2QmOkyttdALOfjiy
         MaMOZn8PIPNqsy8/CgCAZbCui2rAIO1BvgKMhJpWZFZMecsGYyugq1WM2VZJKdeXs9VO
         Xygg==
X-Forwarded-Encrypted: i=1; AKwUvBzvqkgGYn07/SZ2vIRivAG64Imb6jlXZxn3P/sdSRxbEdhCA2DmXNsGwrPShcHyg2soiB/noBF+guDcBbkhu7tL@lists.infradead.org
X-Gm-Message-State: AFuF++mNdjhh6KZSdT1bdWxlLFPCwDOhCmpXHfk5IMNEGAUefLGxtuo5
	1uBaJoyolH5FPmrbC8ZmkNlY03BcxP776gVIrGnZQXBsM3Gul/yZxv0G+Q5Ghw2fp9+kgckPI3p
	mfV7Z5IaXuT+JnkvCnq4bEVhYtiopP+zF8pUo7/BrVJb/Yokqa738IFGuDjECRuhIjNGQ6NVFor
	ak7w==
X-Gm-Gg: AYBFou0YKH/XeLwg44k+PrjPmrgdm03q3p9doTUzOEga2wkCmbQVsgJjHD0takQV15v
	c87DpLPJyMkTIL09AfChuVKELyLUy4uczAdlFE739od722nuauGpxPRlYu1jIyzAxlRksYjv4Q3
	k4WHpCswQ+q1Mx36DVBXwa40CTtDawTnfQxLC2r8XGMGkE1hrguVG+Ppz5HcjXtbrrxIBg0pvW/
	W+LiIJ1xOfjM+lNzx9FaOx6DdpXOFL59mK/E5JgKWhmPpjvPDyhrvggEubXTupUUVUMXq3MrQQR
	WjIQi7WRRKdWD3TNvOV+sIZUhJK04GaxUlp49BiBeWArqSzpyy0mqUPojEeufN94EI8KGP2y8uu
	4PrCvOPj/Mfrsr+RO0MIm+tmlK+Hk2TLAxkCzuMGi7T3NgD35Xaxv382DfpnbqIgALIxBD4BRSY
	zIlYmOdBmey9MYJl3T5PbF2mu6hVkfwTtS+nm+zelcxG8Z8ho7NhXiYF6TtkqDpSjTkhg=
X-Received: by 2002:a05:620a:260e:b0:93b:d7ed:ff54 with SMTP id af79cd13be357-93c2521baa1mr353036985a.65.1790162763257;
        Wed, 23 Sep 2026 04:26:03 -0700 (PDT)
X-Received: by 2002:a05:620a:260e:b0:93b:d7ed:ff54 with SMTP id af79cd13be357-93c2521baa1mr353033085a.65.1790162762755;
        Wed, 23 Sep 2026 04:26:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c5c7asm100347966b.22.2026.09.23.04.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:26:01 -0700 (PDT)
Message-ID: <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 13:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: azbOjK4hQgnCuP3zuC_AWMD6T3hjgf4H
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfXxxmsElVd9stt
 6+uja4gAuMLVs/iDTorSQ0/ZSVgxZrTAia6VX1ulBwAkvqFzzRgaTdaIq3XC0W1y1l8kBhpgWno
 ocZZ8gIP1a6ziVrVxvLdrVKXRbz2f1A=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3b74b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=-cZiopXip2GWjs8Ks5QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: azbOjK4hQgnCuP3zuC_AWMD6T3hjgf4H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX0UF9LSwSY2c9
 mn4r7RkadtY8cKtltgPiH+r8t+z1Tzg3/T3m3Maol4hyxDXL2YaofMV8MneWgEYjNA8/c0CMh7g
 XZw7vcMLQ/V8xLoe+Ua+buCuGA5HDo6OvBMU2iY2Mj6743l0tvUSwX9Gi3s00TfrFbTk8/KFYgx
 tx1m4aoBb4sp8n5ZBH5SeJnJn3CfUbME5jlCsbXQdUpGtPjcetCjz2fmGCMNipQ3A44UZH1ftys
 zd4fl7wsTV3oN3+W5YOvT6go4jt9QxodIooHxHvYmTf4p3I6jomCroijmnylvUpqaQ4YPM7bDeR
 XDZl0ZjK1hOZdeoHNL9QW2OeFmy46uMV4jIVXkCcfGhRmXODV8QkRNNShuytVhvssgLj8mp0HVl
 M4BhZmiaxuGjZJumRpqCrUUkRdPowwdF10aIHt+N1dgqsri2K2vFKVFSzaIV6SGbRNnP3mD0U3d
 xvYKg4awd+DnwdVIjZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_042605_116491_E875E7D3 
X-CRM114-Status: GOOD (  28.56  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 23-Sep-26 12:49, Sudeep Holla wrote:
> On Wed, Sep 23, 2026 at 12:23:50PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 23-Sep-26 11:07, Sudeep Holla wrote:
>>> On Mon, Sep 21, 2026 at 05:19:45PM +0200, Uwe Kleine-König wrote:
>>>> On Fri, Sep 18, 2026 at 11:29:50AM +0200, Hans de Goede wrote:
>>>>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>>
>>>>> SCMI client drivers already describe their bus match data with
>>>>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
>>>>> SCMI device tables. As a result, SCMI modules do not get generated module
>>>>> aliases from their id tables.
>>>>>
>>>>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
>>>>> visible to modpost, add the corresponding generated offsets and teach
>>>>> file2alias to emit scmi:<protocol>:<name> aliases.
>>>>>
>>>>> Use the same stable alias format for SCMI device uevents and sysfs
>>>>> modaliases. The previous string included the instance-specific device
>>>>> name, which is not useful for matching modules.
>>>>>
>>>>> Assisted-by: Codex:GPT-5.5
>>>>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>
>>> [...]
>>>
>>>>> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
>>>>> new file mode 100644
>>>>> index 000000000000..1b4ccfa9dcc5
>>>>> --- /dev/null
>>>>> +++ b/include/linux/device-id/scmi.h
>>>>> @@ -0,0 +1,17 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +#ifndef LINUX_DEVICE_ID_SCMI_H
>>>>> +#define LINUX_DEVICE_ID_SCMI_H
>>>>> +
>>>>> +#ifdef __KERNEL__
>>>>> +#include <linux/types.h>
>>>>> +#endif
>>>>> +
>>>>> +#define SCMI_NAME_SIZE		32
>>>>> +#define SCMI_MODULE_PREFIX	"scmi:"
>>>>> +
>>>>> +struct scmi_device_id {
>>>>> +	__u8 protocol_id;
>>>>> +	char name[SCMI_NAME_SIZE];
>>>>
>>>> I wonder if you tried to keep this a char *. ISTR someone did something
>>>> similar recently and they claimed it worked. That would get rid of the
>>>> artificial name size limit and simplify this patch.
>>>>
>>>
>>> I agree with this. 
>>
>> Ok, so I checked and no other include/linux/device-id/*.h file
>> defines a foo_device_id field with a type of "char *" and
>> then uses that field in scripts/mod/devicetable-offsets.c /
>> scripts/mod/file2alias.c .
>>
> 
> I looked at hda_device_id and its uses. It looks like it does use
> char * and there were loads of drivers initialising the string. I must
> be missing something then ?

If you look for hda_device_id in:

scripts/mod/devicetable-offsets.c
scripts/mod/file2alias.c

Neither references the name member of struct hda_device_id.

So the actual modalias(es) added to the .ko by modpost
do not include the name, they are of the following format:

        ADD(alias, "v", vendor_id != 0, vendor_id);
        ADD(alias, "r", rev_id != 0, rev_id);
        ADD(alias, "a", api_version != 0, api_version);

        module_alias_printf(mod, true, "hdaudio:%s", alias);

>> 2 device-id/foo.h headers (dmi, pcmcia) do define a "char *"
>> field, but then do NOT use that to generate a modalias.
>>
>> So scmi_device_id would be the first to do this.
>>
> 
> Your response made me dig further and I found snd_hdac_codec_modalias()
> which seems to do the magic there.

Note that function:

int snd_hdac_codec_modalias(const struct hdac_device *codec, char *buf, size_t size)
{
        return scnprintf(buf, size, "hdaudio:v%08Xr%08Xa%02X\n",
                        codec->vendor_id, codec->revision_id, codec->type);
}

Also does not include any name field into the modalias. Note this
side is the modalias which shows up under


/sys/bus/xxx/devices/yyy/modalias

not the one which gets included into the .ko (and can be shown
by "modinfo") that one comes from scripts/mod/file2alias, but
the 2 must match of course otherwise udev will not load the .ko.

So it seems the name field in struct hda_device_id is only
there for the kernel to include it in some log messages,
just like e.g. the dmi_device_id "ident" string.

But this is not used by the modpost code which adds
the modalias to the .ko, that tool is the one which has
problems with non const size strings.

Regards,

Hans



