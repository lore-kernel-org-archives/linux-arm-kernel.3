Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A298CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 14:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ij+Sm1Vah+l0KCMrEHjRbzH5BNb2BrYiDgNTHM/FUDw=; b=uetXXlIXbR/7ILIstIStfmfJa8
	V9CH7UAEzst29DI9pWvPmMS7NdNAogxPdlZ6i/26yhQwLWsbqqaYgLpj87zp2T2yxHiz4aU/lSL/S
	W1OuS0QIXrth0ZrPHLTwbi9M3fw0cgB5V0fwKSeEAGBgJeCr2DhxT6+s2PRHN0g+4KYsK3O0KDXJS
	XYp0p7nLtvO0HST3+f0CSscS8ZnAqoLD0eeZi8Zou7kR5c+ESked0mNgyQExio6h0IHIgGOTHP4iU
	6HmXzWVR/9LSc+TdFTo5Wrwd2jp7J429OioXHThUh5nymZg/Dy7GEnW68d9I2w6hBH6xIm9fMfVis
	hGJaV6xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAUWr-0000000B5xQ-2eId;
	Sun, 19 Oct 2025 14:37:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAUWp-0000000B5wX-0rUm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 14:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 284B241891;
	Sun, 19 Oct 2025 14:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406FAC4CEE7;
	Sun, 19 Oct 2025 14:36:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="DAENDZL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1760884599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ij+Sm1Vah+l0KCMrEHjRbzH5BNb2BrYiDgNTHM/FUDw=;
	b=DAENDZL99fVwH3WpVJgi/8/EKcff+KC0u6xxQjNTNgORIUrG1JrkuT8CoMfg81Gxd4CyGa
	jzUOyMalaPFF28PmJwyRiXVvJsS09conv3gMe6DSIF4cCFiF7acLgon+XVvlARpc585s0g
	/hw1Xtk7e06jFuTtUv2OC8iX1NG+D5Q=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5b1ef5a8 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sun, 19 Oct 2025 14:36:38 +0000 (UTC)
Date: Sun, 19 Oct 2025 16:36:36 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 01/10] lib/crypto: blake2s: Adjust parameter order of
 blake2s()
Message-ID: <aPT3dImhaI6Dpqs7@zx2c4.com>
References: <20251018043106.375964-1-ebiggers@kernel.org>
 <20251018043106.375964-2-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251018043106.375964-2-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_073659_260671_6EBBCFCE 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

On Fri, Oct 17, 2025 at 09:30:57PM -0700, Eric Biggers wrote:
> Reorder the parameters of blake2s() from (out, in, key, outlen, inlen,
> keylen) to (key, keylen, in, inlen, out, outlen).

No objections to putting the size next to the argument. That makes
sense. But the order really should be:

    out, outlen, in, inlen, key, keylen

in order to match normal APIs that output data. The output argument goes
first. The input argument goes next. Auxiliary information goes after.

