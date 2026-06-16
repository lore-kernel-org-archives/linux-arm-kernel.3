Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BDDCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 19:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nKMcxi54NbqW8wjhguv+GM1uZZW8w55AzUsDGhMNIY=; b=2RkO5J+pKrtXrsAnPgIjd/osx+
	jKB0r0U6w+yTh1EP7KQV5lPW+NoiZJFfQw5JiAT2MKfFVVFqqNyNf8yDuUX+yNIXto18+B6vrHQXj
	1pKfkKUpPzo6EYdKHKT8ASdUMq+SJ+y2t5LiLVQpZhGfpPudyhXN4UU+6L2sh+AykEoM+D/fOXi84
	jQdpSiLeYFGz+sJPEo6moEahPLOUWJHNIaPg+VvTiO5Vkrb8LuYBnvmM7RyPSekxta9WRaGCTELDJ
	BZAs3yUhf9kaKiYAXgJyrTd7sK81egS/Dl/46UBn+aYlLqSLjIRmm5iudYPQi6iuoZ3USXD7raZRc
	QHZJ25yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZZqm-0000000GGZE-3Fbo;
	Tue, 16 Jun 2026 19:53:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZZqk-0000000GGYu-2LCs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 19:53:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOTTT302756
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 19:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2nKMcxi54NbqW8wjhguv+GM1uZZW8w55AzUsDGhMNIY=; b=iX2176kkjLU1lcEH
	7RkzJ1rIHnwvn3cfxtrZLeunR1thRCKE5l2QKaZQWR9doAk37Jm0avgKfwlCBXea
	eeNvYBm2Jkigi35sDzojS1TV/8fBWo3Suv3IDbPZ+D88cyAQWdMaiXsNH9y9iYsj
	YjNsUBWKELugrjg376j1f++0dmeONXnjV68eT3XbJXQPtp1m2JkdqILhMoF+pYcO
	domb7P2HsPTFTJ3nMlqYxQG9QDpbyayCYlYTKmXX+gr0j9DuQ3HO3/ywS9lCrN3k
	AmzEPKinoeffFYWzCObHEvtcLLz+lcw/2ff99t086PRjZ7P6XfDy9wW+nZTlpX1T
	Gh8MPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1epbk0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 19:53:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157a31ac37so742659985a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 12:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781639609; x=1782244409; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2nKMcxi54NbqW8wjhguv+GM1uZZW8w55AzUsDGhMNIY=;
        b=DE6J+nSr0NksViq+5MRFPSQqjmkApmXRqRG6OFvrjnPrQYkumnaVpmjgZmtJfMw1cC
         fWB+4+6ydcC3MIJJ4UIFuZba//RhHBmvcN6g3ZJmkbQW6C6DQcCS7WOXDrnaD5TyY0P6
         fRATAlunjqrmp9H4cdruW4Zv3w7oEsP8r/VzvQpVhKSPkUZyrMhKPsbQ0ES8rbq4hyNJ
         56l/PRCLjUUoPwhiCsX0SBz8oaVKaOThcVEqgZiZFpbBMZs+Snuyx5P2McPl+fsz6KQI
         OZWvCNJ+hqnFcF2ExkJku2FnSzLYOs5DPcQzl2P2lrkhK8LFt6Ire9JL1xtXMEfNXX+m
         FQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781639609; x=1782244409;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2nKMcxi54NbqW8wjhguv+GM1uZZW8w55AzUsDGhMNIY=;
        b=BAfusQJYOLMfRg1nlIrzqrfw/hF8NRmxtJLTMGBRtaAvGIeYGOsIJx82p1mk19Veg1
         UxF0wyZiEAYo2bMt0Kq4qRoEiGqZpbTdT/6zTrEzLOze4CUy/OvKRJTuurKu9BYhQSBG
         LliA88PeqLuDzgui/MajBhDn/1XoQHTquvK8dxM1BpMZ0PrsseeSxIgRC7sxS+zod4a2
         K5X1DNo9zFCbi0EW/w+Tci3cuCeX/9RtbMX2RXB+wvVNexwAXz5Y/mHf7/8CZScFaeG9
         4fLTZeJEx3P2QcV46OvRHq7fGZXqvNfOln/sPc2WzjDZBsgSZm7302IwvVr4k8j3bLZC
         43Gw==
X-Forwarded-Encrypted: i=1; AFNElJ/o6LRq+sc+fP2Wml+L7EzsC2fI7aMpJjEXTZskuIk+vn650kVylHH41V1QfroLDI7NSj0npoE1eDlCm1lhj0av@lists.infradead.org
X-Gm-Message-State: AOJu0YyFI/g3PgWodzgbjenuuFnkm++vgxWnC4ELCRkRdZbdIFP+b9lf
	mwz1UdVa5XOFnRump0UT3kfdsja87rEiYlygcjrsgvqg6IYm3VsANutvrpuN6f+20tCXjfyBJYU
	xwvTtKkPJalzWa3DLAu1e991BZRSBu4hMfk4f2wSoV/2o2vEhKzqhNM0yX1lWQ7SNk7Xzl6HC7h
	AQOmAKYdU5BQ==
X-Gm-Gg: Acq92OGCCCValdkfCApmgrhF7ecgP5lkp++QRPtsUvcJEuQUvqza4KIUZLJnM4RZBg5
	p9pEYf+72YD0jstonoZdi079Pftl3G6K/eqhBwSTgAdow6yDoN6QNs5kgvUF7SYYacttU6ci20J
	3WhyDprOC30lkwlA9/dKBHahUd0Lwf2QW54I5NOy6O/so3f/JUiKsN1YOP+1xRDbV9nEWMKyVRD
	jDQOj00dUNG/pfcNNZ+pJeMedBRwYWGUADVOpcabG4uSX6KaUbtx7dZI3Gd5aeMEfcPZHbKhlLO
	nwU1prLMjh9RQAxC5VIrScqV7RvHGareKwM/J9Hfgx55mfZmF/Se05hPk0kAHCtQZ3bMYa/eWv1
	dXXmjPSUyJ01owAyozuU+of6RnV/wHl8WFWtFXLmNw9WUeAJrV9mCKLlqh//qidd0+cp64ofEqZ
	Wnmh6Zn8+pn9hDNIpAaboqUOtnGOxlN62rRddB+TDBp7pK4QsWxUEhEAEa5RELGKNwhf4oNt0uC
	HhGQLypx1YT0EX1
X-Received: by 2002:a05:620a:44c5:b0:91b:d037:4a00 with SMTP id af79cd13be357-91d8add3a1dmr192597085a.12.1781639608901;
        Tue, 16 Jun 2026 12:53:28 -0700 (PDT)
X-Received: by 2002:a05:620a:44c5:b0:91b:d037:4a00 with SMTP id af79cd13be357-91d8add3a1dmr192592585a.12.1781639608423;
        Tue, 16 Jun 2026 12:53:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8d1de1fsm708913866b.55.2026.06.16.12.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 12:53:26 -0700 (PDT)
Message-ID: <2d863db7-afad-4413-96db-7a1befca62d6@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 21:53:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: request modules for discovered
 protocols
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com>
 <20260616-scmi-modalias-v1-2-662b8dd52ab2@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260616-scmi-modalias-v1-2-662b8dd52ab2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a31a9b9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=0IHGurON3k-uK7srJYgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwMSBTYWx0ZWRfX2QkLK9yDGIo7
 IYQ1nGwvN7PjZ3WX29MK3OAs12je5QOihjIlkLq7eIfvPlp1R04zZaEyGoutfmdPt2OPWU4EOWn
 S23GmZkk91SmoET1Ae2QrSN/GM5xu9E=
X-Proofpoint-ORIG-GUID: bGU-7Q_s1NioYK0CQ-N0NRLcu6FxdRVo
X-Proofpoint-GUID: bGU-7Q_s1NioYK0CQ-N0NRLcu6FxdRVo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwMSBTYWx0ZWRfX7vQBytf5bSZj
 3uXS7OP6VkWkxav61g2i4WclFySHq43DXYpYQODl0/E3gRjECFLve1MzG4UIVouGDG+eZFY35f9
 SbgHY3LUkqWI1bzUGfjM3o2VHGIctz+W73X5lMedZk/PDr+zg/+aiop+sk6Uqqye2FtoFtsFwYK
 F16BMFCIdrfb2iBEd/GqPZoxBGuTN8gqeaUYFsyg349talEZ64ushnh0uNYKoNtU6BbJJ+GYmQE
 3XVbbYVYPI81V5dXB5q/HA9gTZvS0P3F1ZmcmfSnmvtqbm3BdH+U1eJacAonlAZ71vA/KF6FEyb
 360NzuMNwD+jHJwur1H6g23OdZXsaVzSAXEA8OklpXs1X5fxK2I4HTtQExHrSrXoc7UJbd8Utfm
 9DomAWNv6zE6xV8GwPPskZwmc+ENSCeOj6bs0p/Q/RV5jGwVOUxy65NuTOw+yca2vxOpAk+SF5v
 p06G0919CchUd0K7eNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_125330_717022_81D94502 
X-CRM114-Status: GOOD (  27.22  )
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
> SCMI client devices are created from SCMI driver id tables. If such a
> driver is modular, the core does not know the driver's client name until
> the module has already loaded, so normal device uevent based autoloading
> cannot break the dependency cycle.
> 
> Emit a protocol-level alias for each SCMI device id table entry and
> request that alias when the SCMI core discovers an implemented protocol.
> This loads modules that have registered interest in the protocol; their
> normal SCMI driver registration then requests the concrete client device
> and the SCMI bus matches it by protocol and name.
> 
> This allows e.g. ARM_SCMI_CPUFREQ=m to autoload on systems that expose
> only the SCMI Performance protocol node, where the cpufreq client name
> is Linux-internal and not available from firmware before loading the
> module.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/firmware/arm_scmi/driver.c | 2 ++
>  include/linux/mod_devicetable.h    | 1 +
>  scripts/mod/file2alias.c           | 4 +++-
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 3e0d975ec94c..8538eedc7c3a 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -47,6 +47,7 @@
>  #include <trace/events/scmi.h>
>  
>  #define SCMI_VENDOR_MODULE_ALIAS_FMT	"scmi-protocol-0x%02x-%s"
> +#define SCMI_MODULE_ALIAS_FMT		SCMI_PROTOCOL_MODULE_PREFIX "0x%02x"
>  
>  static DEFINE_IDA(scmi_id);
>  
> @@ -3362,6 +3363,7 @@ static int scmi_probe(struct platform_device *pdev)
>  		}
>  
>  		of_node_get(child);
> +		request_module(SCMI_MODULE_ALIAS_FMT, prot_id);

I think it would be better to use request_module_nowait() here. AFAICT there
is no need to synchronously wait here for the module to actually get loaded.

Either way the patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans






 


>  		scmi_create_protocol_devices(child, info, prot_id, NULL);
>  	}
>  
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 769382f2eadd..2cc7e78e35a3 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -477,6 +477,7 @@ struct rpmsg_device_id {
>  
>  #define SCMI_NAME_SIZE		32
>  #define SCMI_MODULE_PREFIX	"scmi:"
> +#define SCMI_PROTOCOL_MODULE_PREFIX	"scmi-protocol-"
>  
>  struct scmi_device_id {
>  	__u8 protocol_id;
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index a5283f4c8e6f..40a37b6bf1ad 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -852,7 +852,7 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
>  	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
>  }
>  
> -/* Looks like: scmi:NN:S */
> +/* Looks like: scmi:NN:S and scmi-protocol-0xNN */
>  static void do_scmi_entry(struct module *mod, void *symval)
>  {
>  	DEF_FIELD(symval, scmi_device_id, protocol_id);
> @@ -860,6 +860,8 @@ static void do_scmi_entry(struct module *mod, void *symval)
>  
>  	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
>  			    protocol_id, *name);
> +	module_alias_printf(mod, false, SCMI_PROTOCOL_MODULE_PREFIX "0x%02x",
> +			    protocol_id);
>  }
>  
>  /* Looks like: i2c:S */
> 


