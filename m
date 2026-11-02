Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5109606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 06:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4njOSjvA;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=NVZrqDZE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pnRH6wIWSU4ng5turGk9vkscHubh/jFa/k8JOrPTJwA=; b=4njOSjvA8aSZ1M
	p0Bh5WHU8wv/6IG2xy0vR2G4/UcEjFFPhtG1LzD8mBC0a65ZH/9X1md0aHSxZX/uwdnd0fxXaigsH
	Rr3rf5MPQNyZ+VRBAxftefM2h5J1AwJFrn0jUjvvQgqqJ6rGZ/ErynIR6Ho/DHOeDzNFeC5UoTS2d
	ChbZwJ6v/Q7X53hV38exrHKOEmdsCC1BtKuo1LTyKfXV2MOdNiEPONrqW5OQ9ZxKaqOCd8sjOpLeH
	BkB/NLVnA+G/IBnDLzasLUyMzaTU/Tq4yofT1P/Z/GRc7pa5g8AmjNbE1Jh2NAlQAPDdAPQwPWT7s
	A1ssNsogvMwzjwJit+9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlTm-0000000Fe3P-2iYS;
	Mon, 02 Nov 2026 06:25:14 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlTk-0000000Fe32-2avE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 06:25:13 +0000
Received: from [10.94.176.45] (unknown [4.194.122.144])
	by linux.microsoft.com (Postfix) with ESMTPSA id A046620B7167;
	Sun,  1 Nov 2026 22:24:54 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A046620B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793600696;
	bh=pnRH6wIWSU4ng5turGk9vkscHubh/jFa/k8JOrPTJwA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NVZrqDZEMv+lPGbDfbq+11hwHZyvZPpWtIl1MVLvVHgQVEeuyWClmXN5Smku3Dsqu
	 p4AH++tYvGuyFnwORKqEWdARRDeBsPW3eljWOET8GWmOWDlbyhBZRoG7dz9uPpUuNX
	 OvSLixE+P8cBwxwDTejO6+E4IIJUoBawxQaQ7MsU=
Message-ID: <bdab8445-6b6b-40c7-818b-3b0f33b6ede4@linux.microsoft.com>
Date: Mon, 2 Nov 2026 11:55:06 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: xilinx: Request pre-allocated peripheral
 nodes after bulk release
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, michal.simek@amd.com
Cc: linux-arm-kernel@lists.infradead.org, git@amd.com,
 linux-kernel@vger.kernel.org,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
References: <20260923100343.3147243-1-jay.buddhabhatti@amd.com>
 <20261019102110.3448932-1-jay.buddhabhatti@amd.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20261019102110.3448932-1-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_222512_695831_370C39C1 
X-CRM114-Status: GOOD (  25.31  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>



On 19-10-2026 15:51, Jay Buddhabhatti wrote:
> During a kexec restart, zynqmp_clear_pm_state() releases all peripheral
> devices via PM_DEV_ALL_PERIPH. Pre-allocated nodes are then left released,
> so Linux no longer owns them and later peripheral access can fail.
> 
> Immediately re-request those nodes with zynqmp_pm_request_node(
> PM_DEV_ALL_PERIPH, ...) so Linux retains ownership. On a graceful kexec
> this runs from zynqmp_firmware_shutdown(). On a crash kernel restart it
> runs from zynqmp_firmware_probe() in the reloaded kernel.
> 
> The bulk request depends on firmware support for PM_DEV_ALL_PERIPH
> (PM_REQUEST_NODE feature check version >= PM_API_VERSION_3). On firmware
> that does not implement it, the request is skipped and a warning is
> logged. Errors are already logged inside zynqmp_clear_pm_state() and
> zynqmp_firmware_probe() does not abort if the request fails.
> 
> Also, drop the redundant ret = 0 assignments whose value is overwritten
> by the next do_feature_check_call()
> 
> Fixes: 84dbfa5519cf ("firmware: xilinx: Release all peripheral devices from firmware")
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Changes in v2:
>    - Add Fixes tag for the bulk peripheral release commit.
>    - Add Reviewed-by from Radhey Shyam Pandey (v1 review).
> 
> Link: https://lore.kernel.org/r/20260923100343.3147243-1-jay.buddhabhatti@amd.com/
> ---
>   drivers/firmware/xilinx/zynqmp.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index fe650747ac91..96dbb23eb673 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -2193,7 +2193,6 @@ static int zynqmp_clear_pm_state(struct device *dev)
>   					"Failed to clear EL3 PM subsystem state: %d\n", ret);
>   		} else {
>   			dev_warn(dev, "TF_A_CLEAR_PM_STATE is not supported by EL3 firmware: %d\n", ret);
> -			ret = 0;
>   		}
>   
>   		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
> @@ -2206,7 +2205,19 @@ static int zynqmp_clear_pm_state(struct device *dev)
>   		} else {
>   			dev_warn(dev,
>   				 "Bulk device release is not supported by firmware: %d\n", ret);
> -			ret = 0;
> +		}
> +
> +		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
> +		ret = do_feature_check_call(PM_REQUEST_NODE);
> +		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
> +			/* Attempt to request all nodes via firmware */
> +			ret = zynqmp_pm_request_node(PM_DEV_ALL_PERIPH, 0, 0, 0);
> +			if (ret)
> +				dev_err(dev, "Failed to request all peripheral devices: %d\n", ret);
> +		} else {
> +			dev_warn(dev,
> +				 "Firmware doesn't support request all peripheral devices at once: %d\n",
> +				 ret);

Tested this change, works fine. And the code looks good to me.

Tested-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>

>   		}
>   
>   		/* Check if the firmware supports the PM_ALL_NOTIFIERS node ID */


