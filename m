Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6F6C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYaY+vnNNOIe/x25Wx12BokplYhFQWfsKSh+lqn4l68=; b=MCgOX/ph6vvY5JXHkOIm80A2Dw
	TpFjBTkHn0Pe2hhnWlmqAwz7fQ18xxpw7gcvf1b0C9zgVDu4DADqogG2Pg7zOlgI3LJJhuvQSf3lm
	ctJAy9Keuv9uMd0wRC9nbN5cWSltzJFy25ExUj1RUHnCImsFW8JQOsveGcxtAlS7hEj7o4zFCIjDf
	tWMUL8euUxA+mzEzsQLpyC5L1POovxybsUZoTa37nrVuwBmdwIDBL3nwR28blCiL8jcW0hF1LUZP/
	2f3eJNOcCEMQXgal44oKuxdA6QYPD5gSdKtEkc6zqIrUpHT2xiITOTTBvcPBdB4SDaHswGLbVSp/y
	RSxpKepQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY6D-0000000H75c-3B4z;
	Mon, 24 Aug 2026 17:04:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY6B-0000000H736-0ysx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 17:04:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFn1Ex2261400
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GYaY+vnNNOIe/x25Wx12BokplYhFQWfsKSh+lqn4l68=; b=RmhNuGHLFAU4b8m8
	DggsyjFNICrReUXFgzf+yop0aKJlWvwJX0Kjsv+Pyvmf9pC2ro3m2WLjlTa6q5rA
	GCdzszOsV/wyKdIW9y0uo8pHA2HpQ/FlAzZ1BGlDC6loBLAyWQ9YNwp6litmysqM
	4GcvHnMMNTjjvHJwJH1T8/TNyIwsZUH7KzIYEBcWEQwmdq5AgDEojuyfWcv/xF+l
	kaWN2EDc5PPG6QyVN4Tt7TqP6bg6Ds0YHzle6cx0t1gJUyivvH4N7HywjMpnZPEK
	ONiuQtfigFNIHl3D7YQy2DIVh4NSwBl3kxjsPWLNYtCeBzbL5ojMAGkZiRX3Mv8H
	aGbd1w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf2e2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:04:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbedfa3898aso3477707a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 10:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787591077; x=1788195877; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GYaY+vnNNOIe/x25Wx12BokplYhFQWfsKSh+lqn4l68=;
        b=dYJpv7GJj41Mueih/C9xLIwXA5RMAp4iQ60drXenUyGnkphk41kSZrv4A75hKTyb4S
         F9MXq57FQrjUy6ohu+IVNkbGo9YCf/WS3UT48tzSJxfFE3ihyE6yUTxn4FL52Sem7deb
         dOU/lBIpkCWfQl6C5kGioaAKoSFOQy+buWkfZEe6S9TMUEV3JZ1UlR4pPhSfjxVZbYth
         H/2apaXbGvW7mEzQQ91uZfak4nflkNLi5sIBGxf1ujWCG/uuHbePXQGXv8QvQ9SSNEww
         ZTXqyLxlzuUuo6J6eo+m8+INGJFiOG3spxD0WY3P6OWG20/SVEK/OoO0Olm4Bk4s9utV
         44VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787591077; x=1788195877;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GYaY+vnNNOIe/x25Wx12BokplYhFQWfsKSh+lqn4l68=;
        b=RVtrrDUdA5Cqs5q/aBLBdhSQzFtGWWuosMxKEHs4rwBn3aQoRE1UGzBpFVq/+zMsGE
         XNMN9p1HNaFAbaX/vn+geVD/on1oMqCmd0gS751j9VU+Dn2cJUEb7FdIfL4LdwDqftCB
         OWmDIs74z3JvNJqnmj1rd5qP3/UbH1QSVam/wN9BH/TNjtN/pXjbd5HY/LOWh8vrkmLv
         o0kE6QWTSVSL6upmjtM+bciT9U9K6/lH/cxzKp/+E2hTgSB9FU7+4O4kPVd10KV3TSXd
         8mA8Gfcbf6NPQ/7r4XT+nNmNe8tUjd5ae/S7N3zV3iokK6ZlkDGOokBuik/REIOqiBe7
         JLOw==
X-Forwarded-Encrypted: i=1; AHgh+Rq98uVkLjcpe0Nt4g/66xt4tH79r+y8W+ghTknvFtJ+1f76hzTPLeDyJjWA7rPiB165lVtG6SNYAZUp1Eyz/7Tk@lists.infradead.org
X-Gm-Message-State: AFuF++kzC2yqUywRonvnh82vzkq8s/Tc0B00gNLQGFWB4uLVv+NnUgId
	a7qoPagrEXuGJtVS5YmzxiUEAs3cidBo186D2I7SzwLUSeVdJWk14stnqbFvdM2+rO4v5hY/5KE
	X5nxIf89rGgNbO9gd2xjEl4vveoCL1ESY1OzTD9AXE5Q0G4WcjOC63W1ZPWWeKfXrf4BVJqkK7x
	t51g==
X-Gm-Gg: AR+sD12G48I2lAkVXxXMKSW8Ymy3kbIqsYSSaniCpxrIV1gvCW0MeNa0b96FqivYW2F
	XMoV1P1q1doxxMf5OIMP4BMgho/zK38fzj3Od6onJvzue/KqSKvYMBjhcvTy5sdaIz7J912WBg8
	2VR+uQ+f3vdQ9dJ1WhkxIpFkfh8BnFDTaUlQaJ5i0/hh2ibmU6jqY+V7Rfvzn/NqcYJbyRgVHsf
	HnosW9Kj5F3bQF6zaNK3NJOZfT9yvuPvfgzmaRPhGSPbHe5XXV16CasJqoyXqZ9UjWvOZXI9TBB
	gg3lVJfAD49HQUGChT/ZW9qRJgBKCs8p7PHn+EkNjlzahxha+Xchids3ZiC66aF0T8iM7dmwqce
	EvO9962B0guGYArJYaAQV8sTFww==
X-Received: by 2002:a05:6a20:6f8f:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3cd911bf820mr335865637.11.1787591076718;
        Mon, 24 Aug 2026 10:04:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f8f:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3cd911bf820mr335639637.11.1787591076011;
        Mon, 24 Aug 2026 10:04:36 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e60abbsm1329566a12.23.2026.08.24.10.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:04:35 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:04:31 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 2/9] firmware: arm_scmi: Extend transport driver
 macro to support ACPI
Message-ID: <20260824100431.00002daf@oss.qualcomm.com>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-2-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-2-cb6b88b4ebb3@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE0MyBTYWx0ZWRfXz8caHltSKr/C
 kZN6sZm9EAojT/X8LOxRDuaoTLvOPzmnV54Y8IcwcEzve216oo9QPp1pyoAsP8AR/l31JwtwFQL
 Gq5yuzwNtbye5L1IowWddh5v9ZCG+u4=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c79a5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lMat701TfqHOrGvLdtAA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: BPelioTk9MPJS3K8z6kJW8kop4W1NCv-
X-Proofpoint-GUID: BPelioTk9MPJS3K8z6kJW8kop4W1NCv-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE0MyBTYWx0ZWRfX4m76N+k0+aPI
 abP85QEFwlqO8H1HxQtBu9pT9Cu9S/bkhobzIWWuI65PGqbUYV1FzF0thhxEo82qqTW4XARWhO1
 tOMLj/BUk+MEROIdCfIyUhQmS3AQKLqhzwCsmFA73deO2aTZbo5Mb0BvVKzZNCZfGTyZW2tkFfs
 Q9Wrby63vsTgGqc14FmJffNrvB6gG24I/4unB03oVp0KGORifRVQXDPsGietZEz0D1eERvSLKfQ
 sUK/rCn7q9fezEH0Lq+zjy+XyMsExW5x8Rel0/YgecP5I+WKYkoLCOIN6V0rchFmPVHS2/JoWPC
 PrAMPHq0zsR7tUjjvOqkTqR9bUa95p/1kPvg2kmLdU1ULNvwuCCxaurpXmXIg5HLj323m8jLA9S
 j9BGDISnAno0oxBozLBjdEAmzL6OmTTrvxaS0cdr+TYpEeVr//eN95b16PQlxc/3hmjyvhoeZd0
 7G7OB2eSirxRar07C+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_100439_403471_C8B607DB 
X-CRM114-Status: GOOD (  27.37  )
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

On Thu, 13 Aug 2026 12:32:57 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> Extend the SCMI transport driver helper to support ACPI-based systems.
> Introduce an internal helper macro that accepts both OF and ACPI match
> tables, and expose two wrappers:
> 
>   - DEFINE_SCMI_TRANSPORT_DRIVER(...) for DT/OF transports
>   - DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(...) for ACPI transports
> 
> For ACPI, set the generated platform_driver .acpi_match_table via
> ACPI_PTR().

ACPI_PTR() is often more trouble that it is worth because of need
to guard the tables if they turn up in code where ACPI might not be present.

Now if someone fancied doing the work to make it work like pm_ptr()
then that would nicer.  That one lets the compiler both see the stuff beyond
the pointer, but also do dead code removal on it later.

Anyhow, doesn't actually matter either way here because you only use that
with a non NULL pointer in a driver that is ACPI only.

If you really want to do it, maybe pair with of_match_ptr() but
that one is even worse as maybe some will be having fun with SCMI and
PRP0001.

Anyhow, random diversion aside, it makes no difference in practice.

> The ACPI wrapper relies on the firmware-node propagation
> provided by the preceding change so fwnode lookups on the spawned
> platform device see the correct firmware description.
> 
> Keep existing DT users unchanged while allowing transports to be probed
> using struct acpi_device_id tables on ACPI platforms.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/arm_scmi/common.h | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index cc7d11c3c1f3..0b896171faa2 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -9,6 +9,7 @@
>  #ifndef _SCMI_COMMON_H
>  #define _SCMI_COMMON_H
>  
> +#include <linux/acpi.h>
>  #include <linux/bitfield.h>
>  #include <linux/completion.h>
>  #include <linux/device.h>
> @@ -615,7 +616,8 @@ struct scmi_transport_supplier __supplier = {			\
>  	.th.supplier_put = scmi_transport_supplier_put,		\
>  }
>  
> -#define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
> +#define __DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __of_match,       \
> +					__acpi_match, __core_ops)	       \
>  static void __tag##_dev_free(void *data)				       \
>  {									       \
>  	struct platform_device *spdev = data;				       \
> @@ -679,11 +681,18 @@ err_mem:								       \
>  static struct platform_driver __drv = {					       \
>  	.driver = {							       \
>  		   .name = #__tag "_transport",				       \
> -		   .of_match_table = __match,				       \
> +		   .of_match_table = __of_match,			       \
> +		   .acpi_match_table = ACPI_PTR(__acpi_match),		       \
>  		   },							       \
>  	.probe = __tag##_probe,						       \
>  }
>  
> +#define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
> +	__DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, NULL, __core_ops)
> +
> +#define DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
> +	__DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, NULL, __match, __core_ops)
> +
>  void scmi_notification_instance_data_set(const struct scmi_handle *handle,
>  					 void *priv);
>  void *scmi_notification_instance_data_get(const struct scmi_handle *handle);
> 


