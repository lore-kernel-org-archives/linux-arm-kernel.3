Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03124C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHH5No/d6gK16qDfihynuj16LmMumAiiVmAs/BzwDkc=; b=yLOtPRpVUs0dJ39pyw/hH14xUE
	VGA9uv++/IZLOdZEEMBbzBzfvf6qo9jFAtLjqcfMjfC3Hk/uevUd1suKKPmyLnQuHb3bNYGdxko7o
	CqF7TkML8KD9K/rEt4ZCK0SohCo3FIDJxS07WtpU9rZ3vIsSyhDN+5AaHUaTSc2dBcEPUFCHQl0ng
	JtNdWFJyhwCgrUqKBTRB82YrEAHI0vaFzI0qzuv8GSXuoHgZP/qMPM68BlCnJuhOi6aPymf0GK9l5
	w2KUUG5nQD4ekrNDLnsDVXKMUzh7sOgWDDW106HUrEwxjUiI9wrrNON+VVcP6fAQYyW1TUMt2/25R
	Q9pYMTJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZtR-0000000Elaf-1ss6;
	Fri, 18 Sep 2026 14:48:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZtP-0000000ElZp-0CPD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:48:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IEQwEr1020030
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 14:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zHH5No/d6gK16qDfihynuj16LmMumAiiVmAs/BzwDkc=; b=neK5cG8AuR+jOvy0
	3tl6pVJjFoD/X0tupaQ1EiBON5lQjYY3VACqmtdocu5OJ2ylQi34YJ2sv/xBqw5J
	CxZp/+GWO7uPW82E/UCudAPEDe21rD4bP8LsmNGJGxFwThFHdM3MjbXlf2DQn1mx
	p13KjkULEaCUUX4AGpb7+T6326hRnViTMEW1fLL+sOSC3uVeaZGokab0OJNyRpwe
	zJ+Nk5ckVD9QTx/GIF28f1UWYgGuFUSRyBKklfmVG1LCB2v91aBl6Y+dE5h7m7a4
	DiEP0K4433MVL4nI8JYmmLeQHZgxyFQiizLYW+S2bMPsRn9EKCZvK2DwEeabTq3U
	oru+gQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs72u035j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 14:48:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ae8e7e546so172810285a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789742925; x=1790347725; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zHH5No/d6gK16qDfihynuj16LmMumAiiVmAs/BzwDkc=;
        b=T4qbeeDzIPBAShRKVm+4EBybbm2dSeah4vP1aqWN9Ep39/gB9Pm0y3Jf0v4adM8YwZ
         6Ti+Uc12KRjIbkOOScKj6iZ/cocBSxHTthyHWw9p3LTkyyYWdbNvOiNgClmi8x5FSdxl
         lwI6591dZeah2DAwoS3Ie+vdOOtJ9kLUT7yKbr7MHUXYlYLl8dWscLVELDdS9mp/IMm3
         Ccc5K5fkaKV9QNLNQQ+2YD9A7wLv9lxQq10tg55sR7MTZwFf9r+/ImJLHX0FOZ8od3X9
         N2KHb1y3XISZWwP1B+Ut7+Fban6KjgxRjmshOwkHCR8vwx045fa1hnNKxBOf6eGcy+Aq
         DU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742925; x=1790347725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zHH5No/d6gK16qDfihynuj16LmMumAiiVmAs/BzwDkc=;
        b=gUtfM4cMuoMBra4Rvp015dFE810BrDHufYFqvIbbbWu6I0rVmIR99mS8qDX3RZ9iKn
         Fkg0zVoseYYO4n/Fez24IYztpsOF2hbbqgiG7PsoAkcSM47fMPlRlTfs82ECyVndj3Hd
         utXI0nuDqsz2pxjOQ5PZBv4jt5IFnvnlj72+K1aNRj5c8Fci3u/sRSR2mi0Z3F8d+YHu
         ktBk0o0KjNxNUPBap/q0wxsjKRnYYJU/G2cVov34HAbHFWHv3JpmI4widtOMMYeo82p1
         W0BAvGHJxjtLVmLbzcoYoJqDux3K2yWXAxhxyZLa1armvynigV4eQS0xfTb1Ml/pFx3d
         /BIQ==
X-Forwarded-Encrypted: i=1; AKwUvByBVGEbBlc50DJ2VneSHOBkvJiRObWUxMwvgTnUjnspdkUeLs1LWJqUjVHGaoKlZHrFD7Q4WwMx31TUiNVLbdwM@lists.infradead.org
X-Gm-Message-State: AFuF++mzfceHpBE5cD4atpNYzsPl+uPr9E2L21llzYlFw/hiBNyxZlLN
	Yk24xYBvrRAsjbBbah84ZIoZjEhvPUC5T6xC0zlje16A6Gs1u4TPDf8yZJAbBXDs3bEr66cBdgd
	tKqOvOzpAC356CHZGigpWQmWpRSt/I3c9k2gbKWYSHMZBDQYNX24HEp0wEksb7nINI1XB4BFar1
	KVSQ==
X-Gm-Gg: AYBFou2qFp/CZQoskNH5aXJA2t0ld48R5pXawryEmNE1XOPmTGbS82L4z1XDJxyE8hc
	D3gbH0whDmJPvQCaVuEScGEcBQPvQ/mzsz3ZYy5SL3c0VbAzGANnT+nPkHjVeTNTUyvpfzLTe+1
	ZhGYIIBvPc3Sia8c4BZCT0s0E4L5mUgzIPqbyZTa6PE7W2oKNcbMIZUbTJH1fTnHnKUiYXMh9/D
	QgKdQ/hqdFqjfwQ0oPFZbkpZVEFL0CywgOse7ssmjzklWF5PIJYQ6F1joyk4lZj4eFWmwcq11I6
	4fYMLPtkEP5Hm2il9+9BcE05ThnRHIj6+lgtTzT62ycU9GFJ6h6X8Pyk8shAWLjdODpxyGMW+Yq
	WjCsMKLOUm5dRQuLhqEXRAExecb6AZEM+Och6CeUg32J3NyXhZhiauT5TYAVuYqE=
X-Received: by 2002:a05:620a:4686:b0:939:feaa:949c with SMTP id af79cd13be357-93bdc7503a2mr376113585a.36.1789742925573;
        Fri, 18 Sep 2026 07:48:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:939:feaa:949c with SMTP id af79cd13be357-93bdc7503a2mr376109285a.36.1789742925068;
        Fri, 18 Sep 2026 07:48:45 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcc1160a1sm12355955e9.4.2026.09.18.07.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:48:44 -0700 (PDT)
Message-ID: <b5a41e7b-3a6a-4c1a-9475-b40e85ff4916@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:48:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
 <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
 <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6SurbfLLnAxK7lytHnbLjONBujtCSm18
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIxMCBTYWx0ZWRfX2b8T09bKlgfA
 U4dQs589nz19dt5Qbu1E0Cto4OylQvny79PqiinLCnu/ZIvXJdgQytSEmpFmOLRsINNvU85/3Aa
 l7CMyejFrYo9MCeFUFT3X41oQ8VB4ew=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIxMCBTYWx0ZWRfX5brncLcjYZT+
 EdMaqRRxwujK8GhczMcNAKk+lUDhCbNhVID+h2LyPstCj69A0VJ/QQnAOsMfveNfXRoydIp3INY
 2OdeqrYT7pK9yUF9rOXoenTh7Bu5gLpTIXbNiUDl6yKJOLK7BcDHR6kzQUlSDJhwkjO1Dc8b0aG
 b7wFvL7/t/eb7WRGBfZn3OVJNQYPaG2kLQqqaHclpWqblrGJSkxbpWt+x5TwY6tZDdSCDJopUxg
 4GCIHsTwJ807sraqJZdpog9dTdkKQRUQBO30Nbrw5r/9u75b6vMFaq2yf2ZhUvDI3Ak1gGFdw0C
 bY7QEdkirYDa+nXDKotzlItjLfcSTtiJ3zl2Gzzhy4Woi70pk6haNWGAdJFDpY1sMhplkmn2j7Y
 t+g8DE4MhFmxvHcNEtTR+NTLnwGcDIHPNjFPFKm9D9tXd7vcrwgUzSX3cug4zM9fvNeGcqp7zk6
 LPOb4HAN6Lek/QUNDnw==
X-Proofpoint-GUID: 6SurbfLLnAxK7lytHnbLjONBujtCSm18
X-Authority-Analysis: v=2.4 cv=DO8acCNb c=1 sm=1 tr=0 ts=6aad4f4e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=EXJEmdUHkevauOIPG10A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_074847_089662_80B30A8B 
X-CRM114-Status: GOOD (  19.51  )
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

On 9/18/26 15:38, Sudeep Holla wrote:
> On Fri, Sep 18, 2026 at 12:13:10PM +0200, Daniel Lezcano wrote:
>> On 9/18/26 12:02, Hans de Goede wrote:
>>> Hi Daniel,
>>>
>>> On 18-Sep-26 11:53, Daniel Lezcano wrote:
>>>>
>>>> Hi Hans,
>>>>
>>>> thanks for taking care of that
>>>>
>>>>
>>>> On 9/18/26 11:29, Hans de Goede wrote:
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
>>>>> ---
>>>>
>>
>> [ ... ]
>>
>>>>>     #include <linux/bitfield.h>
>>>>> +#include <linux/device-id/scmi.h>
>>>>>     #include <linux/device.h>
>>>>>     #include <linux/notifier.h>
>>>>>     #include <linux/types.h>
>>>>> @@ -951,11 +952,6 @@ struct scmi_device {
>>>>>       #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>>>>>     -struct scmi_device_id {
>>>>> -    u8 protocol_id;
>>>>> -    const char *name;
>>>>> -};
>>>>> -
>>>>
>>>> What is the reason of converting the char * to a fixed array? That limits the name and may result in truncation and potentially name collision, no ?
>>>
>>> Because of how modpost works to generate modaliases inside the .ko
>>> any string buffers in device_id structs need to have a fixed length.
>>>
>>> So the truncation / name collision issue pretty much applies to all
>>> foo_device_id structs in the kernel. People should now to make sure
>>> that any strings used will fit inside the fixed string. And I would
>>> expect the compiler to warn for overly long strings.
>> Ok, thanks for the clarification
> 
> Not related to above topic, but just wanted to check with Daniel if this
> solves module auto-loading for you. Was there someone else who was testing
> this series and was having issue with earlier versions or its you only
> Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
> something vaguely and couldn't trace back all the versions easily.
Sure, I'll try it with my t14s laptop (Hamoa)

