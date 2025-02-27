Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39B3C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 23:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCjZ9jMbRkmsPS+4OvPLxv/lO9UYo97B0D5ofNvRttk=; b=N47lcZ86Op5Hm0d4Uhju/9xdp5
	Z27GsR6bDJsZ7kRNgZ0ULLGrtkvJQLRiiyN47qcJgAFV329nAHOyP958LPXotrqZdTfc3thB1CS9L
	21uEldjur9biLG88OjbAjdBXsfZsdfMjdyrJZ185nOixg/onalGQnA5Px0PlK8TKvCIihsk4c/MMO
	1Auhe22g78pQo4ouVxGtCpzZWp3krmu8dzqUN42kDz/OIjUAixZ1nSeTgHwZUyO5vWTEXtni99Pg4
	dCBJyyfMH7kI/X2enGGUtkpcZnYBJH5B+FDqGua9Yk6qwsgz2cL/O2FSgWA/Asnd0qjeBout1E+L/
	J1E+6qYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmxt-000000097H6-1Ruz;
	Thu, 27 Feb 2025 23:06:49 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmwL-0000000971B-0Apc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 23:05:14 +0000
Received: from [192.168.35.166] (c-24-22-154-137.hsd1.wa.comcast.net [24.22.154.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id 769CA210EAC0;
	Thu, 27 Feb 2025 15:05:10 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 769CA210EAC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740697511;
	bh=dCjZ9jMbRkmsPS+4OvPLxv/lO9UYo97B0D5ofNvRttk=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=qkPpQObiOfq236VL3tI2mDXngA4cs30KZVyxnx7UZmqoO4Z+PP1V3dKTXgl0ym5W7
	 qMXyfTC13t91+BJwaSAJFCTKnoPVNvcXzrl4l2RzeByTYqZTGZ/27ctSzlj4kptFmW
	 OeOnUXHhnxrYZun4MyIOGtSDxPpwz48NiW+qy72Q=
Message-ID: <51612cb0-fa25-45c4-9d49-dc2580706a41@linux.microsoft.com>
Date: Thu, 27 Feb 2025 15:05:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org,
 eahariha@linux.microsoft.com, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, mhklinux@outlook.com, decui@microsoft.com,
 catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
 arnd@arndb.de, jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org,
 lenb@kernel.org, corbet@lwn.net
Subject: Re: [PATCH v5 05/10] acpi: numa: Export node_to_pxm()
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-6-git-send-email-nunodasneves@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <1740611284-27506-6-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_150513_108605_E520C51C 
X-CRM114-Status: GOOD (  10.70  )
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

On 2/26/2025 3:07 PM, Nuno Das Neves wrote:
> node_to_pxm() is used by hv_numa_node_to_pxm_info().
> That helper will be used by Hyper-V root partition module code
> when CONFIG_MSHV_ROOT=m.
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
>  drivers/acpi/numa/srat.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
> index 00ac0d7bb8c9..ce815d7cb8f6 100644
> --- a/drivers/acpi/numa/srat.c
> +++ b/drivers/acpi/numa/srat.c
> @@ -51,6 +51,7 @@ int node_to_pxm(int node)
>  		return PXM_INVAL;
>  	return node_to_pxm_map[node];
>  }
> +EXPORT_SYMBOL_GPL(node_to_pxm);
>  
>  static void __acpi_map_pxm_to_node(int pxm, int node)
>  {

FWIW,

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

