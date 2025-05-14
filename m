Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71188C54756
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 18:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4yJ06SsolOKo0n1KNhATc5mR4LtStAPg8hMk/tROHY=; b=mjA4ZjE/eLtTMOghHSLp0iqiUf
	xPMG1mkUolB7xsBJ8IRI/OKcVdKWbq+soOOvki9eA/j+TRnF833xpzYOPyxp52FNmDP61lq5Uyfvx
	LqPsKnYexzHQBTqIeffmWWKQhXV0Wld7qbit2kZn44K/pVMEzK+5C3E33lO50Zy9Oa1wvQiw+jFXY
	BfjnB/6uOW3UcOVc8gzHxI3l5Ou3IeZpQGGSfKEo+i8Z7P1eWOhq/heHiOYCDUtu4iWAJ9dEoYjwV
	J415LIVbsogzIvR0IG53xrXX6NynG0KKfQuk5w/PRBIi7xt0FdSlCALKOOUN6850sL7FC8YwRnXeY
	1yWETcLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGvK-0000000G1sr-0oxX;
	Wed, 14 May 2025 18:33:46 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFF8O-0000000FmQw-3dfX;
	Wed, 14 May 2025 16:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747240749; x=1778776749;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BQxpe1gKe+N60hkJWYTw2nQy3pGjcVIp7WcxAHzbnzc=;
  b=gOoKzFqaGqIP5tvw+sTVyyRreemau6IV/NqaYvfvd0QaEauf0RV7pbOj
   r1VZ/jDw1f/gvkw72ph2Dx7KaqSSqO/QIZk6X8nQfuVf4TM8amKXFM7hK
   iRzQ3kGtkf+/c8rSyyk1Yqc74OgisCIYgAtnM5Oh7U8eOYZuoRq0nMV3V
   8kJ7jLwwqCLAD9Bs3cngRR58MflJwb2iHcf7RNhmP4LmxFKSETfI8VJLB
   +6NM737cbG56l7YC4oZcvE45sv0J2eoZuhFSAIaRIv0obD+cABai7Y6r5
   uoLqKIjM2EwQchiazvQEsMyOVXdamgHqtXNiyDoCmByv8NoQj3YKAqoJ1
   A==;
X-CSE-ConnectionGUID: rCVbW9RRSyeUhpJEjSSRiQ==
X-CSE-MsgGUID: 9vaPSy5RSUCD63rq8KRtMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49223603"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49223603"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 09:39:07 -0700
X-CSE-ConnectionGUID: dL1HJHziTNqYT0Ugnl+VeQ==
X-CSE-MsgGUID: HT6VqRyKSneRimqS3nA3iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="138511665"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO [10.124.222.100]) ([10.124.222.100])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 09:39:06 -0700
Message-ID: <d46bd014-02d9-44ec-a29d-b925f268ee03@linux.intel.com>
Date: Wed, 14 May 2025 09:39:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] PCI/ERR: Remove misleading TODO regarding kernel
 panic
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
 Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_093908_947825_3984FF74 
X-CRM114-Status: GOOD (  12.30  )
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


On 5/8/25 12:10 AM, Manivannan Sadhasivam wrote:
> A PCI device is just another peripheral in a system. So failure to
> recover it, must not result in a kernel panic. So remove the TODO which
> is quite misleading.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan 
<sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/err.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 31090770fffcc94e15ba6e89f649c6f84bfdf0d5..de6381c690f5c21f00021cdc7bde8d93a5c7db52 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -271,7 +271,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   
>   	pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);
>   
> -	/* TODO: Should kernel panic here? */
>   	pci_info(bridge, "device recovery failed\n");
>   
>   	return status;
>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


