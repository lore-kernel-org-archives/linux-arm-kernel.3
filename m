Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CA7CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 20:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtwC9CXJly+CcF9ksjU2Oxl/SgqlNJdHppwI7tS0WQc=; b=uob35qlm78SHrAt79EqDEHzQ+3
	LcM+uIPFIXdrl1mFJ5o7xKXQuRMHRR7eNB0ZDpTNgEML4VSiXcAcBO7YYYGnWMLHHWsIpVqyaci93
	/MEDGZIkYL2q9TAZJzrIHNr+qVHUgwaRT2+4yuMJSG+R3D3ClBvc6tHt2PqLr5WHomx+Sk2mrzVBo
	AdoeJFqrKJsNw+0I7ktgJMBEftpcdOSEPExGrhnaZE5jJPursg1IrnW3l204jMZ9c4EYYbuXCqIZ0
	hK3KDRrDeHw830Gkvbp2dh4gutZDVRJseuGCQ6pB6JeYUZ+NTWGl7o+tSq9iVKKcHG4+h1h6K8xU2
	dNk6SjFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFHP0-00000007BlH-2pvg;
	Fri, 09 Oct 2026 20:41:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFHOz-00000007BlB-3Pg5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 20:41:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D86CC60202;
	Fri,  9 Oct 2026 20:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BDB11F000FF;
	Fri,  9 Oct 2026 20:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791578472;
	bh=dtwC9CXJly+CcF9ksjU2Oxl/SgqlNJdHppwI7tS0WQc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=R9ividgij+OVceiV18k/xtyYOEOd6A1oD+fojTAerK0S3Alk9CPACSugq58brvf6l
	 7jdzlGZKGL6DKbnFTHc0W8Q4SoXCEH+ADF+5/kThENlJ5jMr6djZnKF9A0Mqta2BaA
	 /t0D/7xGCHnUERa3Q4NFEFp1VET6nV/HrG+XEq3hMw/RKCx9CbhWHt6CuMAYCUH3nZ
	 Jpx7CGEV6XikbsYZtMf+tXg7t8RNWxjbsAnSd/1fTRH9xXyKfPXuaaTmmIoIqqclhk
	 yd3z6mNUiOUm9UaSByTHMM6ODTjJan0aI3oAwtcYIBTI3nue8W7dL4ZauILirnus4w
	 i0UEscWYNwbug==
From: Nathan Chancellor <nathan@kernel.org>
To: Simon Glass <sjg@chromium.org>, Ting-Han Hou <ue081723@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <CA+NtrhQBK8uW32qO3dXxVxO1GSN-0EJfyJ16tnyx0o52T17WtQ@mail.gmail.com>
References: <CA+NtrhQBK8uW32qO3dXxVxO1GSN-0EJfyJ16tnyx0o52T17WtQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/make_fit: Ignore schema checks when
 decomposing DTBs
Message-Id: <179157846311.778396.11816417974301350236.b4-ty@b4>
Date: Fri, 09 Oct 2026 22:41:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=745; i=nathan@kernel.org;
 h=from:subject:message-id; bh=kdjyHRSIuo6AaP3CxoJy2I2uitv1KnUbvJMCb1u7VXU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFknA5NbphZNmLvhZaqk9CUT9trjFQdfnfl0nifauJn7B
 k/Pna6KjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRLU8YGdb6yid0Jt046xNv
 83HeVPlVCjMFYu/W+78/+uqLfZOlhCkjwxR9r/lvuV1U1xnvztf1Wt2U5Ff0bfPGNu80M2eh9sl
 CjAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

On Tue, 06 Oct 2026 08:19:54 -0700, Ting-Han Hou wrote:
> scripts/make_fit: Ignore schema checks when decomposing DTBs

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] scripts/make_fit: Ignore schema checks when decomposing DTBs
      https://git.kernel.org/kbuild/c/3bf2237f59af8

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



