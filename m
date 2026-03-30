Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CDE1061B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 23:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t45tnYDWZsG1khbHgAc45VhFz8HmN2CnAvvZjkYxjlk=; b=Nl5hIuFnVuX4tkSJ8RBN0Y+e8y
	J9Kn8zQ/wy0USrdSxkuedI9yaZIlYhF2XmrMaE1m6tfaNevY7lOth/9x3gndC5GRLQOIdMLEf02tr
	YjdfBclqDHKRWfxOv+1WD4i2+GbrMiXQRYIqEWVS9eAhrJdGJt6MTL1ISCuceHAUFZH/UsSx5OM0i
	wjoBRxmiBSutP7vDSEYcfTIWoHT9jlxkm8szs0dZr/RAG7u86w0L62AZQq2J/zWtwoXJae7v7CAY7
	lHVloVTEfGI+/7lBZXi3CZ7cYQdasMMkGgKWusAFBaxJMlAfrNFtVDvyXxv9gKjIQ4DZpfBNN+KYh
	m59wsjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7M90-0000000C1vF-18hN;
	Mon, 30 Mar 2026 23:35:42 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7M8x-0000000C1u4-0wST
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 23:35:40 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43d0245e24cso84572f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 16:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774913737; x=1775518537; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t45tnYDWZsG1khbHgAc45VhFz8HmN2CnAvvZjkYxjlk=;
        b=f6wv3PKQWEuY/FCjs5JXvzInz50u2tCzp7LcpK/lorLk7dV3PRxVsJ6/3uu97utixT
         ySIUoScSvKIgrC0dnj9cge/bGOhqJohQbWe2hrSRvCgaI+mXs5LOXKj3lUAI104DGU6x
         mEpDYIDhDdnGSLgAsn5QPRUaIB2pVEvpISj7gT+X0H+fLmAJ0xq8wXCdaNZdcokiMXOm
         FSzk8mJFwRAfvmaNojkbcaPN18NhtCnh3kWrGiAK5Hkc7N10vm/N8P0m4P/tf9VKpMdX
         MuxxzlV7Xf10RdJru8kPTE5jylTfoC8tXEeHRicjZeMoAAse83eSCx03cq48eLPq3P8J
         tWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774913737; x=1775518537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t45tnYDWZsG1khbHgAc45VhFz8HmN2CnAvvZjkYxjlk=;
        b=Pydb1DvkEhHBbSbLAAe8/YhRJoGErE7t+mHdRBVVWwGcZnb4SUPmfnSD/quPGfw4V5
         jkVldDChvQgJHIuNZKohBxXitgb+++UJllUDCCFbIdxGVs9Nsge8JUmCzRuo8mFOl0/z
         XWkwPHKce7cTI4nv6hyZ6/C/TVnRE/76ER7+vKzIZkfpFTcqHBqLOY1A/yfa4+4i5lUq
         BrU3tx9KLoBVuLTSaTjruGbz0+bmbCbRTzjN61boPqb0EJZ7UI33OAFedCiCLcb7KWf9
         AvJOSG2tHoDUPcPonwVmWsagUPAu6SztBmoWNgCtie5Mbur8BurcegWdna1OU0NSAEvT
         Jlzg==
X-Forwarded-Encrypted: i=1; AJvYcCXMR2uvdriqHQlQjwufzHLYSp19gf3nSO3nKxw1gssfq+WVwAGwjvEWF0yrA3UD+KPp4ZF9G2+XrZhp4EX9rghi@lists.infradead.org
X-Gm-Message-State: AOJu0YzPmxcJ1caTdsCIAOEvP2t5KBXymzTeeRhi1VPGtuXJ2scv325w
	rlPfdwZN1NgXBm9T/tFPaL/06fvJJ+MfMXMIMeVEsaOWYHJ5AHFGFwHa
X-Gm-Gg: ATEYQzywFQLFj8IkjlW4gTL6Ipm/bkyMpgwdPNV6qbS+X5moaPtiibQQXMuMcXBAKT1
	amOMKQmcA+17T1BvcdaYINs/nei7f/S32Ov03w9G+BCZDAg1QQPX5oG/ePzadEdxIgDi1WtN1yO
	9DNlncs+RXSydtb/FCzKDwgNtG/7/m02zzyE16C3Y6GqFPEQNzczs0hFljQ2KAzhdy6o8zvMcYI
	sO807d0FKdDxR/mQMyF1GwCLloVkl72C63Mn/hd6CVK5ngaKfIQ+eKPENntpHh3zqtMQYi1Q1Tc
	8iGfU6gyb+igG8UuX3TBDryKxT4sU7nEiyp/BJl6oVKAWe8qIuBbwecI8DCyK1iCwUdrzze/01+
	8lJ1djheOO6xkQ7jd7dP/ycF6m2iX0dBloh/exmM2S8XuXiIEbYTds/2yrbwuEiW+rs/LjGgMf4
	W5uV8tzmNp6Yecb3CzfIZxBL2FvQ==
X-Received: by 2002:a05:6000:70d:b0:43b:45d1:f42d with SMTP id ffacd0b85a97d-43b9ea2bd01mr10281733f8f.4.1774913736851;
        Mon, 30 Mar 2026 16:35:36 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d50a:b400:fc92:d05b:3301:b722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf247102dsm27956754f8f.27.2026.03.30.16.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 16:35:35 -0700 (PDT)
Date: Tue, 31 Mar 2026 02:35:32 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/2] phy: hdmi: Add FRL TxFFE level control
Message-ID: <20260330233532.ulnqiqrogezswht2@skbuf>
References: <20260328-hdptx-ffe-v1-0-53ebd5dea20a@collabora.com>
 <20260330085723.4rewkbs76lz3scum@skbuf>
 <f2827d9f-ddba-4fbd-8d1f-a1a2d1b94708@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2827d9f-ddba-4fbd-8d1f-a1a2d1b94708@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_163539_284454_E416E809 
X-CRM114-Status: GOOD (  19.02  )
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

On Tue, Mar 31, 2026 at 01:56:32AM +0300, Cristian Ciocaltea wrote:
> On 3/30/26 11:57 AM, Vladimir Oltean wrote:
> > On Sat, Mar 28, 2026 at 03:54:53PM +0200, Cristian Ciocaltea wrote:
> >> ---
> >> base-commit: f7b64ed948718290209074a50bb0df17e5944873
> >> change-id: 20260328-hdptx-ffe-a89c51e66904
> >> prerequisite-change-id: 20260227-hdptx-clk-fixes-47426632f862:v1
> >> prerequisite-patch-id: 5c1d442fae39103bb758f54738aff33d2491401d
> >> prerequisite-patch-id: b86f30292308345387d2a6b50949ad040b931592
> >> prerequisite-patch-id: b1335105db9177cb10c64ed1bf0867832e6aac2f
> >> prerequisite-patch-id: 83db6603d13e19f239e89fde2b26366eb0106b7e
> >> prerequisite-patch-id: b534395ad315811861f11859a3946f65c90c631a
> >> prerequisite-patch-id: f9637e57c902f35218cda658397416f84f7285cb
> > 
> > Sorry for my ignorance; who is supposed to act upon this git-format-patch
> > base tree information and in what way?
> > 
> > As things stand today, the build infrastructure we have in place will
> > not be able to apply and test your series unless it applies directly
> > onto the linux-phy/next branch.
> 
> Oh, I assumed that since b4 makes managing series dependencies straightforward
> on the preparation/submission side, there would be similar tooling support on
> the build/integration side as well.

Sorry to disappoint - linux-phy doesn't use b4 to build-test patches. It
gets them from Patchwork directly (as you'd get by clicking the 'diff' button),
then figures out whether to apply to the next or to the fixes branch
using the git-format-patch --subject-prefix string ('phy-next' or 'phy-fixes'),
then posts the checks back to Patchwork.

I can somehow imagine why no one rushed to improve this. While sometimes
somewhat useful, I can see the risk of such feature getting abused to
create a giant cobweb of dependencies that is suddenly no longer the
developer's problem, but passed on to somebody else.

In the future, please submit as RFC the patch sets that you know don't
directly apply, and mention that you're only posting them for early
feedback.

