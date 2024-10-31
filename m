Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19617D767F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqvY1FdkPNuOeLMP1wREhSeYVKoRbaudNYxdHd3X7Lw=; b=DDe6Y30slzWYeOaq7ghl8IUo8l
	IFU/3Lr/OJ8Ssjso+IaaSQUo9RuDUlSblZNNfya9C7Wm0/sN0y6100wiLlZrNEnefHuP8w6+qCgZh
	7sCXymrPpP+T/n259NkQ2L6o8452hEPZ/0T/Ek7XJ96BijaJSkjG3xeHG9mtXFwc47DSkh1IZbV+t
	nFkY0Mzm9OjK0shjGOnGFE/ebY19sFQEJCP/dSQ9eAiyvgnfSsIWHFXY85JVQwkEqLEgJn0oZBMrw
	s7/LCCojENVnBpfZWP3jXrZwekVrl/XtmsUH79nuG+ESfvvjA/1YUTHW571YbDPk3OhRGJqG0aN/G
	TyBTxXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ZAs-00000004NNc-2kOp;
	Thu, 31 Oct 2024 17:41:34 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Z9D-00000004NCl-0x3P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 17:39:52 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37d58a51fa5so69372f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 10:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730396389; x=1731001189; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uqvY1FdkPNuOeLMP1wREhSeYVKoRbaudNYxdHd3X7Lw=;
        b=Zfr73Es9/bfgnMWqbNJsuGTDesyKeLfZkp+jqtoeoOCJ1KUeyQf+UQH2S26tCYlvSF
         rtrLs8G1pSBqr9ec8aoYTpd1kiQrKSRuE/NMn9gQRzhIL3Z7pTlcHUN5z8lXdW5Xc10I
         FDZKdBiocbdPqdGBbWUdPxBaV/dqn7NOKLV16BwR5v9BqYPwmIZf6RYFEoklq+qgDtM2
         E1fM5Si4pC37ueo22hIc3HvZjoof/JILMIXTiJjRbPmaeBjYFKtX4vCZrFwMWoUKBAHr
         NPgUvv66CP6RQaMclk3MbyjXLAUWzOiRR5YnNdJV1xtO7S3V/1H1HVI2KbtNeWzRUHEP
         w5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730396389; x=1731001189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqvY1FdkPNuOeLMP1wREhSeYVKoRbaudNYxdHd3X7Lw=;
        b=W57M3ZE3lIguRrWGG3OP6yP2b9ipxw5nG54YvE/kteQx/5q6GOZKas7h5gnt23M1Fo
         l9u3I/XcFjaF5Y9SrS8ouTfGeS0xuFGELyUivUzTQm5+4TajG/m6u18mScwV+3NqlbtC
         OMvxzmiA7M8Ha3hRwuMK4pi4cC/c+XEGQXoO4b79j54iFpMsI3Eo5qoBTJp0BpnuqOmx
         CjEx2vUWIyfqncH0oKHCDhdoDuhi3+jAXDQKUkfGB4/HagCgdks/bDCUNgvWpguEDBt4
         R/2jeH81rcHfsfFpx8lWaPc9zoh7QSoKZUxFjLVNft5r5W4SeUCmYe7Pwlmh865vGfWE
         Lt0g==
X-Forwarded-Encrypted: i=1; AJvYcCW1WPLpJEWFpEEVqyC7svUZFhXcv8zFAewlLfVmOmjALepdy61usXACunHL2b8TjUHkfKGAuXfEnZ+w4OD6zUo9@lists.infradead.org
X-Gm-Message-State: AOJu0YxCiqMCqHHFWRvEehbq9d+Idw7Ks/bQS+jXc+sib7/SiUabaXH3
	Dz1oJINxFMWehrAh+6mS8I46pXrXtEmEHKbhMs6D5pwQdMZ6ulh7EWrUfriV
X-Google-Smtp-Source: AGHT+IHznYfg7XnUHFbFmXkwCN88TMBnRAuRY9xjBHvTnqdJucFrQwoWQFJgSXdcQGNoUalg4yBOhw==
X-Received: by 2002:a05:600c:1c29:b0:431:50b9:fa81 with SMTP id 5b1f17b1804b1-4319ad368f4mr76025085e9.7.1730396389495;
        Thu, 31 Oct 2024 10:39:49 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6983ddsm34746115e9.44.2024.10.31.10.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 10:39:48 -0700 (PDT)
Date: Thu, 31 Oct 2024 19:39:46 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v7 4/8] net: stmmac: Introduce
 stmmac_fpe_supported()
Message-ID: <20241031173946.53ydl7v7gihtdkx5@skbuf>
References: <cover.1730376866.git.0x1207@gmail.com>
 <917f3868cdaf8ce1d45239117c3ea1c8c45ba56c.1730376866.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <917f3868cdaf8ce1d45239117c3ea1c8c45ba56c.1730376866.git.0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_103951_290290_1EF7F5C2 
X-CRM114-Status: GOOD (  13.08  )
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

On Thu, Oct 31, 2024 at 08:37:58PM +0800, Furong Xu wrote:
> Call stmmac_fpe_supported() to check both HW capability and
> driver capability to keep FPE as an optional implementation
> for current and new MAC cores.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---

Doesn't this commit actually fix a bug which patch 3/8 introduced?
If priv->fpe_cfg.reg is NULL, we will dereference that after just
patch 3/8 has been applied. During e.g. a git bisect landing in between,
that crash might be seen by users.

Thus, please reorder these 2 patches to prevent the bug from existing in
the first place, and say in the commit message that the reason for the
introduction of stmmac_fpe_supported() - initially simply implemented as
a single "priv->dma_cap.fpesel" check - is to prevent unexpected
behavior on unsupported FPE MACs during further refactoring.

Then, the patch "net: stmmac: Refactor FPE functions to generic version"
should be the one which also reimplements stmmac_fpe_supported() to
check for the presence of the newly added primitives.

