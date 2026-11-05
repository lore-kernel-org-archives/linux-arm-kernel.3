Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34799606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2wYHrs3P;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PgsB4KG+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P6zJzHowc63hNrslPmkjJoluc08V1uJth2yk4JtAx/Q=; b=2wYHrs3PSC51M6FUTbYysSNKj0
	twLlc4i2iH/9NZDyMXqIMU4VxZIb5XkpLZaz1evmH/2mLBZvfJVc3Hk/C1Wdbe6aPypXzHuGtXbHb
	aL/64J3P97ph2shtYqlEwnrEB/YJhfj0OG+dBKuT983fk0UT2USCquW0sPfmIpf7mBdF51pNBO9a5
	4dEVaK6SdP/6/POLUEpR6k/46SDNUwVS93GkEAm3swU8pvReJSeRIJfxLPEW9xXMhpR5nY2ekpGpB
	FkGVisyxTS7reu4WXc6EnquZIh05fGCaG2YW3enBmL2fkB4F/dUcp4fiVxxBchVFkJraShCt1BEpt
	lqVCuTFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsvF-00000008Ajy-0sNR;
	Thu, 05 Nov 2026 08:34:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsvD-00000008AjY-1Ix3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:34:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 173044198F;
	Thu,  5 Nov 2026 08:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 18C8F1F000C1;
	Thu,  5 Nov 2026 08:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793867651;
	bh=P6zJzHowc63hNrslPmkjJoluc08V1uJth2yk4JtAx/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PgsB4KG+YAoQ79kF8S5BnWq41I3LxQihafA1LQ2Q1GYDgrfSetMiFusaqGsfYRoyv
	 v4uLUxCL9SEAlH3BQOLrOCFJlIeEawjUVVlO+GVJp9cNCEVwV0wrYlhYIOHOELRXhx
	 bnjHxsWG7GarO8D02mXITbOdTBrokZPEim8ynEP6g2m+i8HtcskAYfnQfhn78ZVt/O
	 nO9Cj4b2DezjsYwhySxnymrrKfutZFtGtk5Vbf3AG6SjgzmGuNCbK8mMctQkO03+30
	 SUtyhFnIuMdGYo0YiG5AI+Qht4S4WdNZn4IBi+5O9ZzOoMKSGeN9OP8OBHg3IohoI5
	 n+XP28Ae2nY8g==
Date: Thu, 5 Nov 2026 09:34:07 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Russell King <linux@armlinux.org.uk>, 
	Eric Biggers <ebiggers@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Birk Skyum <birk.skyum@pm.me>, linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v11 0/2] crypto - qce: make algos optional and remove the
 BROKEN label
Message-ID: <fbcaiobhykgsgd3zyayvrkuk5lnrjtmwelxkxvbijukdbcw4i5@7e2qyfekariq>
References: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
 <kh74or65txfcprntqqljabnszooj5ppuwizj35flv2r245zbvo@nfue4wdblicr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kh74or65txfcprntqqljabnszooj5ppuwizj35flv2r245zbvo@nfue4wdblicr>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 10:58:20AM +0100, Bartosz Golaszewski wrote:
> On Thu, Oct 22, 2026 at 10:57:58AM +0200, Bartosz Golaszewski wrote:
> > This is the follow-up to the three smaller series fixing crypto
> > self-tests in the QCE driver. It makes the crypto algorithms opt-in via
> > a module parameter and removes the BROKEN label so that the driver is
> > built by default.
> > 
> > The dependencies are:
> > - https://lore.kernel.org/all/20261016-qce-fixes-sha-v1-1-3ee5a30d84f3@oss.qualcomm.com/
> > - https://lore.kernel.org/all/20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com/
> > - https://lore.kernel.org/all/20261020-qce-fixes-aead-v12-0-77a2e09abd0c@oss.qualcomm.com/
> > 
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > ---
> 
> Hi Herbert!
> 
> Gentle ping, can these three series + this one now get queued for v7.4?
> The three dependencies have no more sashiko comments. The ones for this
> one are minor about missing module params docs so can probably be
> ignored or I can send a follow up.
>

Hi, another gentle ping since v7.4-rc1 is tagged. Is there anything I
can do to move this forward?

Thanks,
Bartosz

