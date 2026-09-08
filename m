Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB21C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXneAIUNGJegxe+7TT6326qIQdc44HdWTzL48112N7M=; b=TXVaadQ6ZCf93C4sWFm7X2q0qM
	kMhyHWA0WkVEqvQar6gBGnUu9UqSR6q5w0vfQnd+bjNHL3HZM1D6q88u7j6NbX+N6ApRNUpjSFsRv
	t5flLTS4SnDB9dkQ+hoJgwBuEtBcwsUcPlT0ZF8y7B2rqJKHU28SKPWDI+k38lXGRv768PGAtTXnF
	O/qna3jLJPwAi4UlaxKR9sb7LAGC4HMsvxY/wXcChyps0Bt31vx2t1RlRdxV/eF4Y9mqsaWzmEhs9
	1BZodL3Sa/VTEjgIHIW8juXrezpuOrCL7IrlE2gK8faA2gGhNbx4bGkN9iwmzjaHPOdsPv9N8Uk21
	ka1zm9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3r93-00000008OK3-1qTD;
	Tue, 08 Sep 2026 08:25:33 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3r8z-00000008OI1-0blL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788855929; x=1820391929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MNBOqjbiFY5cvbGJa0db+s9GIphlrm1cbRc2huUpNRk=;
  b=mq91t3T8Re4VAJdEozTAyhliaM9PDE5R5Gk4dxsWprSRv1Mvf2eD9UKW
   NljhPYkDSLVGhTVBrEnJkHGzQZha1ZFcn2g47nvLlg0aKx5qlr5EPlhAd
   cVIKD+uZGVf2cHRXK91swtq63ISEZu17F/x0bj4VsgY7rn78GzAnQ9siq
   qXR1ZQr6XyvVgAWNnCqmvI6gbEgpuOdGrWDGne+u5PiMkSaJAtZVhe4FM
   a/4o4vddKzDbnCB9CewHR8VuCG+SQim+RtVIk0ypRcXCbZf3aqdXMzagD
   2qp88kuoWCrwmu04kO5fIAB7KYpLwgxuveAMs/l97y40HzOoz06pUmBvG
   w==;
X-CSE-ConnectionGUID: 2YB6XBPpR3i37FZrr28yKw==
X-CSE-MsgGUID: xbv5OgdBTiar1L03Aks3xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93114669"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="93114669"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:25:25 -0700
X-CSE-ConnectionGUID: FvNg+61LQ+2F8JqhAbC94Q==
X-CSE-MsgGUID: kH58JbXiSn2WhYPwc39J2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="269196840"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 08 Sep 2026 01:22:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 08F8E99; Tue, 08 Sep 2026 10:22:18 +0200 (CEST)
Date: Tue, 8 Sep 2026 10:22:18 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 10/22] thunderbolt: Unlock host router ports during
 startup
Message-ID: <20260908082218.GA106095@black.igk.intel.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-10-1f80085f93fb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-10-1f80085f93fb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_012529_230031_D13CA36D 
X-CRM114-Status: GOOD (  20.10  )
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

On Sun, Sep 06, 2026 at 08:36:33PM +0200, Sven Peter wrote:
> The downstream ports of the host router may still be locked after a
> reset. Unlock them when the software connection manager starts before
> scanning for any connected devices.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/thunderbolt/tb.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 47753a5c0f2e..bf1c192ec10a 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -3016,6 +3016,7 @@ static int tb_scan_finalize_switch(struct device *dev, void *data)
>  static int tb_start(struct tb *tb, bool reset)
>  {
>  	struct tb_cm *tcm = tb_priv(tb);
> +	struct tb_port *port;
>  	bool discover = true;
>  	int ret;
>  
> @@ -3049,6 +3050,14 @@ static int tb_start(struct tb *tb, bool reset)
>  		return dev_err_probe(tb->nhi->dev, ret, "failed to add host router\n");
>  	}
>  
> +	/* Make all host router downstream ports accessible to the CM. */

Nit: Drop the . from single line comments

	/* Make all host router downstream ports accessible to the CM */

> +	tb_switch_for_each_port(tb->root_switch, port) {

We should introduce tb_switch_for_each_null_port() at some point, not the
job of this series though.

> +		if (!tb_port_is_null(port))
> +			continue;
> +		if (tb_port_unlock(port))
> +			tb_port_warn(port, "failed to unlock port\n");
> +	}
> +
>  	/*
>  	 * To support highest CLx state, we set host router's TMU to
>  	 * Normal mode.
> 
> -- 
> 2.55.0
> 

