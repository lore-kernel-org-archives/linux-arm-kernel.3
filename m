Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D486C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 09:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6o93EzZgArFEXso70k/zel9WBKSefg4X2XkOXRWKMQc=; b=Hs9WTWTsHIT/Ns5yWQXRty6TE6
	pjOFh0Ue26dq/bl37XEcaLGWHCQ63GG/qN0XZXXoR1j+YiLzPcW6D4aZjXrkFcWGfRiEH2aWlaHXW
	VYh03EoeyJZ5MaqFcIReIV7SdhUndRDNkRgZb3+iffbimU5DrNYgLzR4nzxvheDz7mvKZ9ebov7E3
	pfJcmsptDStpWlkW16Xg9k8YY8PsS60Dy5rpppvd+tbIPRizIDLXy0I879m2RKL94kl3yCzbJUKuy
	haV39fy4LMfximdGXzOG85bpo7HgIEJdjQ/iRH8z1aJ0QCWSxfyG5JPuqzYo/tHc+q03BfHc9ykId
	sVUORsEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Qdu-00000001b7i-3Hcc;
	Fri, 04 Sep 2026 09:55:30 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Qdo-00000001b5F-2PmY;
	Fri, 04 Sep 2026 09:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=6o93EzZgArFEXso70k/zel9WBKSefg4X2XkOXRWKMQc=; 
	b=L/KyITLHZr1yZhJVD4DlynQK0Je1HVSDjG4vdWo5d+f28euKGjwEqnROtxJ9rubPvFFljf4p7Ty
	3ZUXkeqTIk/LDVH5z13EOwHiNfXlEYVzdLYZuEsvFYQPiSQuxJnyrkjZcxp9RT6q+GGnNAKi4P5dV
	L45sH8IHI7lRqfoLI13RoxAUpmF83bC1WTnFGwEsFW52BuFR/J9VZB2hj0jCb34Q1Q32zm5k942bB
	ADllkQvpLFyHB1LjpiV3YkNdx9q48Iyte3wRNHmKRFqQ6/VFXPMhKbTrXb8vNaf+sH2vca8lQ01Sb
	rISYWkje5i/CpLx/iXH069tuWM2vvfJcAYHQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x2Qda-0000000An7t-1KVg;
	Fri, 04 Sep 2026 17:55:11 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 04 Sep 2026 19:55:10 +1000
Date: Fri, 4 Sep 2026 19:55:10 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-crypto@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>,
	"David S. Miller" <davem@davemloft.net>,
	Heiko Stuebner <heiko@sntech.de>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] crypto: rockchip: pass crypto_info to irq handler
Message-ID: <apqVfhB5JHcBEHaM@gondor.apana.org.au>
References: <20260811044916.160856-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811044916.160856-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_025524_626179_314C67E0 
X-CRM114-Status: GOOD (  12.44  )
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

On Mon, Aug 10, 2026 at 09:49:16PM -0700, Rosen Penev wrote:
> The irq handler takes the platform device and calls
> platform_get_drvdata() to recover the driver data.  Pass the
> driver data directly as the devm_request_irq() argument instead,
> dropping the platform_get_drvdata() call.
> 
> Assisted-by: opencode:deepseek-v4-flash-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/crypto/rockchip/rk3288_crypto.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

