Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEEDCD98EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 19:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGsMkJgam8EBung0dk0OiaiHmA1xJP7v0n8Hj/9uW6Q=; b=pqXLPvhIFwdeBo/iYyCzNS/33v
	EduQpRY67YBqiXepFrBZV3Ydc4ndKOGRAMvEgAF5YtFi46S/qMjqXuOtbjsIgECF/FyozAx8Ladhz
	YXV5brq6McGpqtAofxMTwtsBmoy9QdDORh+aRykYHr0K6+o0GkdzQCbKNa2JEbnYxLL9rMQmggKIy
	5NWQnx3L2GDhLukfZQvoAoIuR01YMZDi4N0/1/PpH16/NdOefMZ80OuRyo2eRjBob7L3aMFxTX/fl
	C/yr432vDUleLaXdwF3O05XX6cHi+vQykhN14u3TTafVN4OxmRUjddPItIm3jm1NljpJS3EYhb2uO
	lfzngmTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZZnU-0000000GG9A-38RA;
	Tue, 16 Jun 2026 19:50:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZZnS-0000000GG8U-1d8t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 19:50:07 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOYpH303248
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 19:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGsMkJgam8EBung0dk0OiaiHmA1xJP7v0n8Hj/9uW6Q=; b=OG0bAwodm9r6cATx
	NnKo8aUVOXegxwYWnumlVvfKZ8nOYJH96M6iigIy8xmBq8FNuJKt2x1F1RghWfCQ
	FcsbPHBwkD0oQ4lqKLewTxrgNhChXGvL34KyDj0+ZIwYJck7Bdz+dgrrgK2t2zHn
	Bq1YrL7dMpVuLZ1j14SC9L8J+/nSw/bVfyady2aCl3TnmSbmTK8+Bsv1qDOCgXMT
	thNi5F/oYfo6KLP1rOZESomGUvvyFLSE2F5ySXSwOi3eDyd6wJKFYCcyABpdvz62
	taeAkJkiRxRKEKc/W3pYpko4C0V47sjhDoVRDh3ndU5jxJCL5eLmCBX7Y9Ak8lLG
	tVwFDg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1epbjgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 19:50:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9158f07f5eeso792034285a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 12:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781639404; x=1782244204; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mGsMkJgam8EBung0dk0OiaiHmA1xJP7v0n8Hj/9uW6Q=;
        b=W1THhp1PZONLODDHWZvLpXRb6k3xiEeMNqK2VUF0NE7jZTHs5LobwDMJWsZnIXjiRL
         DDUVm++PQoEDaqGNmIUenHuuD6sqNQLhWTak+1XgN16AsokQCcTFLaWBK7KMCOV0AIzI
         BeaL9nKRBy5jYNlDbFCSQGZM2nvcP++aL4M+HUBEn5vaYnYXmRkOguSfplgDFXCp0Oze
         0uf2K7MZFboyQ2i5H97lel5iKuv1qjFdz3xEsDkjZu8Qclm/Xfk39ebyWOO7CrsZ3KU1
         jbNXV4HT7vLsrHOb99H9g5ar493nZ/iymh3GknSu0XgKGfWSr7oZLAsQM+hDm91FiwZ2
         hOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781639404; x=1782244204;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mGsMkJgam8EBung0dk0OiaiHmA1xJP7v0n8Hj/9uW6Q=;
        b=be8fARGwCbkxzTcoR+Pp7AKRadLo6E5tAat4LUq7AUil4gwa/b5Dd/+7LGC6Ez/v0o
         hEK7n6/srWkNFHjlbkfI3bzh4ev1bDsE9yH88jgsd9j0MMM5wTlTxCvaVcU01iwJhIHq
         oZRZIzHVFPfQtSpRyCEqEnS/A1zKxpygRg1EVdfd0f9vjmFMfBZrQr+uaYLonpcJNLtx
         OZkJwD+YEeIMjrtRQHMk27dBkg+WxnS0742YEYIdQOoyHSVfiPJqY29eT1IPsQacwOlr
         LQmr39EgNZxYdlgd+b+kLIyEYG0RfXzQyPa+4dApCSRlLqY0QRQ1gZ9BVCEX9cV9zHTG
         3hSg==
X-Forwarded-Encrypted: i=1; AFNElJ/5veMh3Y+vh3/4OJ+8Z/Dq3CoizpxIWieImrG/u9AveTyxwqnPrswWC4mmoKq77cOQxsfcxPF4hZjyp67Hm3Br@lists.infradead.org
X-Gm-Message-State: AOJu0YzT6twX13FMYMEQoZi9qbniklON/UtTOFowgAtXSQ0b6st5tyCr
	g5UmM2wH1Vxh7Y/k87IgWEJUslxntVKCESPXk6bPPBjRWOCihCtFNDysnTpWdzTRZEdz7v/5d8W
	U/jnni7/puqXlOinVeGhHBjxVMDEVybinM57piqVaKmCD9TJe5BDvqQNrKPxidLVyvPb2Ocn71L
	q1qYnYOnZgKg==
X-Gm-Gg: Acq92OFI6yMWaGdeaJbIypGee7ceSRmfTJYBtom5ERx5JixdIPexrhpVMzsxi02y0Ik
	P0kqrsRo7sECIsMy8RBAX0DU9sXA1S7otXGkKVO07453S1LZZzGgre/QJlgR/k76cLX1Gk//+TT
	UVMSlEUuwWbT/FadT4qEG6MQ3h5ai6yscWW7nFugZS2WCbi7GD7a6fD/ULC3hx7/RFzslqiR8l2
	r+zZ9bdMXk6UOie85mUrz3aa9+JSGso3w4a2dmEHvQQZ8W2m+w3cIbFH1BsqcfyfoLEYlKKv5A8
	MP07f7Z7DJLUlpGlcSLLhYw1u8I2Rlyo44X2PUIARLy37AsxRPZsMDHrj720tINUWEmfnCOzvTR
	gRw5QrW6qsPG6usUoQx191mjbBNeirDjHwTGxD8Nw4Z46GI0Lgxf3jdcpWDoT7XVvnyLqEt1AUp
	Ps6yVJjVvTEleV/0I+odN6R3laLb2HxfdmeTUYWHiQR+JHL4JsSsNv06y1lT3NKkK7Y4qeFBI5u
	tUK24mDvmxzqDIR
X-Received: by 2002:a05:620a:2908:b0:915:d32a:1cba with SMTP id af79cd13be357-91dbc52c4damr54820885a.27.1781639403562;
        Tue, 16 Jun 2026 12:50:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2908:b0:915:d32a:1cba with SMTP id af79cd13be357-91dbc52c4damr54813385a.27.1781639402784;
        Tue, 16 Jun 2026 12:50:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693791c5d33sm5431930a12.8.2026.06.16.12.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 12:50:01 -0700 (PDT)
Message-ID: <38433aed-dafa-4275-ba0a-237a1db645d9@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 21:49:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] module: add SCMI device table alias support
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com>
 <20260616-scmi-modalias-v1-1-662b8dd52ab2@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260616-scmi-modalias-v1-1-662b8dd52ab2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a31a8ec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=W37sn8zWFLRx4f5Wf2kA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwMSBTYWx0ZWRfX/CFvZoScSA7d
 ygcberEZvMMYVUHczaPDe7CXgm7bN1+f61Lr/226D4M+1Zk0+4B5DlIYy5yb/PRYfTqYUumuP7R
 MKbyA5P260y0BtxidiqcyTBtxh5QsgQ=
X-Proofpoint-ORIG-GUID: zOaKh-Fmxsg8bV22FvSOxBfvk9Gcofmm
X-Proofpoint-GUID: zOaKh-Fmxsg8bV22FvSOxBfvk9Gcofmm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwMSBTYWx0ZWRfXxr99wdcRdaY0
 itY0cKJYJkokT4Ya7BhgxEseYm4zweAql06UfWWWP/4NXQCwGAxIlMJRVFqhRS5Smr6hAVxxoGn
 +cgSINOFDlRes/0Cur7wxBplvkj/BNavwynIfl48sLXhqH8EvqydyMLM2uv0d4Y/e4T4EyPDRhb
 xIN29n8I8q2q3pfsQmbIy+0bKL5anhscK7Rw70jrRArGZxQbrNBTNjP9pFlkd2r8f4ctENMn/hJ
 2MDfPJ9WKweiE2d/ypxn4Mc3ZoBcCiF7zM4DKLPgksBQvPcLvmpvM5bZkHKPxX+6kvSjMuDphRc
 EsSUigDnlKqNwrS9N9BhNN1/beNceFJSs6INZb286WebeYpGkMIh1sbNFUhH+izZ7IDEwj4kh5l
 IdMRmC1sVCsF9oIfZfkWHDH9Q3FmctT8m7vjuNPqslXcZ9s/A0znk+9QC/L6JPo/Fg2c1Nn5l1B
 EDol7R8uabvKf2N5d0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1011 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_125006_560720_ED715C0C 
X-CRM114-Status: GOOD (  32.98  )
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

On 16-Jun-26 20:09, Bjorn Andersson wrote:
> SCMI client drivers already describe their bus match data with
> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
> SCMI device tables. As a result, SCMI modules do not get generated module
> aliases from their id tables.
> 
> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
> visible to modpost, add the corresponding generated offsets and teach
> file2alias to emit scmi:<protocol>:<name> aliases.
> 
> Use the same stable alias format for SCMI device uevents and sysfs
> modaliases. The previous string included the instance-specific device
> name, which is not useful for matching modules.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Thank you for this. One small nit, you add:

#include <linux/mod_devicetable.h>

to include/linux/scmi_protocol.h

But that header only declares pointers to struct scmi_device_id.
so you can just forward declare the struct type there and
then only include linux/mod_devicetable.h in places which actually
need it, rather then dragging all of linux/mod_devicetable.h
into any file which includes linux/scmi_protocol.h .

Some people are working on untangling the kernel headers for
faster compile times. So IMHO it would be good to not introduce
new cases of headers unnecessary including other headers.

Either way the patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans





> ---
>  drivers/firmware/arm_scmi/bus.c   | 19 +++++++++----------
>  include/linux/mod_devicetable.h   | 11 +++++++++++
>  include/linux/scmi_protocol.h     |  6 +-----
>  scripts/mod/devicetable-offsets.c |  4 ++++
>  scripts/mod/file2alias.c          | 11 +++++++++++
>  5 files changed, 36 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 793be9eabaed..7e344f2ee18d 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -13,11 +13,12 @@
>  #include <linux/of.h>
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
>  #include <linux/device.h>
>  
>  #include "common.h"
>  
> -#define SCMI_UEVENT_MODALIAS_FMT	"%s:%02x:%s"
> +#define SCMI_UEVENT_MODALIAS_FMT	SCMI_MODULE_PREFIX "%02x:%s"
>  
>  BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
>  EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
> @@ -141,7 +142,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
>  	int ret = 0;
>  	const struct scmi_device_id *entry;
>  
> -	for (entry = id_table; entry->name && ret == 0; entry++)
> +	for (entry = id_table; entry->name[0] && ret == 0; entry++)
>  		ret = scmi_protocol_device_request(entry);
>  
>  	return ret;
> @@ -197,18 +198,18 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
>  {
>  	const struct scmi_device_id *entry;
>  
> -	for (entry = id_table; entry->name; entry++)
> +	for (entry = id_table; entry->name[0]; entry++)
>  		scmi_protocol_device_unrequest(entry);
>  }
>  
>  static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
>  				      const struct scmi_device_id *id_table)
>  {
> -	if (!id_table || !id_table->name)
> +	if (!id_table || !id_table->name[0])
>  		return 0;
>  
>  	/* Always skip transport devices from matching */
> -	for (; id_table->protocol_id && id_table->name; id_table++)
> +	for (; id_table->protocol_id && id_table->name[0]; id_table++)
>  		if (id_table->protocol_id == scmi_dev->protocol_id &&
>  		    strncmp(scmi_dev->name, "__scmi_transport_device", 23) &&
>  		    !strcmp(id_table->name, scmi_dev->name))
> @@ -245,7 +246,7 @@ static struct scmi_device *scmi_child_dev_find(struct device *parent,
>  	struct device *dev;
>  
>  	id_table[0].protocol_id = prot_id;
> -	id_table[0].name = name;
> +	strscpy(id_table[0].name, name, sizeof(id_table[0].name));
>  
>  	dev = device_find_child(parent, &id_table, scmi_match_by_id_table);
>  	if (!dev)
> @@ -282,8 +283,7 @@ static int scmi_device_uevent(const struct device *dev, struct kobj_uevent_env *
>  	const struct scmi_device *scmi_dev = to_scmi_dev(dev);
>  
>  	return add_uevent_var(env, "MODALIAS=" SCMI_UEVENT_MODALIAS_FMT,
> -			      dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
> -			      scmi_dev->name);
> +			      scmi_dev->protocol_id, scmi_dev->name);
>  }
>  
>  static ssize_t modalias_show(struct device *dev,
> @@ -292,8 +292,7 @@ static ssize_t modalias_show(struct device *dev,
>  	struct scmi_device *scmi_dev = to_scmi_dev(dev);
>  
>  	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT,
> -			  dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
> -			  scmi_dev->name);
> +			  scmi_dev->protocol_id, scmi_dev->name);
>  }
>  static DEVICE_ATTR_RO(modalias);
>  
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 3b0c9a251a2e..769382f2eadd 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -473,6 +473,17 @@ struct rpmsg_device_id {
>  	kernel_ulong_t driver_data;
>  };
>  
> +/* scmi */
> +
> +#define SCMI_NAME_SIZE		32
> +#define SCMI_MODULE_PREFIX	"scmi:"
> +
> +struct scmi_device_id {
> +	__u8 protocol_id;
> +	char name[SCMI_NAME_SIZE];
> +	kernel_ulong_t driver_data;
> +};
> +
>  /* i2c */
>  
>  #define I2C_NAME_SIZE	20
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 5ab73b1ab9aa..48b346a26068 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -10,6 +10,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/device.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
>  
> @@ -951,11 +952,6 @@ struct scmi_device {
>  
>  #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>  
> -struct scmi_device_id {
> -	u8 protocol_id;
> -	const char *name;
> -};
> -
>  struct scmi_driver {
>  	const char *name;
>  	int (*probe)(struct scmi_device *sdev);
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
> index b4178c42d08f..da5bd712c8da 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -144,6 +144,10 @@ int main(void)
>  	DEVID(rpmsg_device_id);
>  	DEVID_FIELD(rpmsg_device_id, name);
>  
> +	DEVID(scmi_device_id);
> +	DEVID_FIELD(scmi_device_id, protocol_id);
> +	DEVID_FIELD(scmi_device_id, name);
> +
>  	DEVID(i2c_device_id);
>  	DEVID_FIELD(i2c_device_id, name);
>  
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 8d36c74dec2d..a5283f4c8e6f 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -852,6 +852,16 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
>  	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
>  }
>  
> +/* Looks like: scmi:NN:S */
> +static void do_scmi_entry(struct module *mod, void *symval)
> +{
> +	DEF_FIELD(symval, scmi_device_id, protocol_id);
> +	DEF_FIELD_ADDR(symval, scmi_device_id, name);
> +
> +	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
> +			    protocol_id, *name);
> +}
> +
>  /* Looks like: i2c:S */
>  static void do_i2c_entry(struct module *mod, void *symval)
>  {
> @@ -1491,6 +1501,7 @@ static const struct devtable devtable[] = {
>  	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
>  	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
>  	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
> +	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
>  	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
>  	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
>  	{"slim", SIZE_slim_device_id, do_slim_entry},
> 


