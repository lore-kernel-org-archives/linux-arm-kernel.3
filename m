Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DE0D0C84D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2C1Cq0R3bvdmMZOqB7Bn3CVMUrTKnWJxHrygGNnHrE=; b=OOa4VcrJEbOpXMy4Sq1C5p3UQu
	NFmokLVJr88qpDkJeEzvYEY9Zr26Zjjm4WPF96Pj6okJS4Yuq/PMrIImtd+1phY7c/ofqFfCRPI/I
	CMdjibJ8JRUwW5jrVYPQhxDm7radhv67pxC0YDMe7TfwkLadWLhoYk/55UEk1YWjeXuR4kwciEbIk
	NTxRX9ArUc89cPEUV/DpUT5IfivTNCqg7DOOcvJWTAYDOoIJGjkjr2v7UdsUbE5Bv7dIarC6nAb2D
	IY2h8yRMYJpe3pRvD6kmNqKQU5TpUuqaw9hkz+w2vKSLT1yiR78yc821kUxck7wmUOCIZ95OoSFcL
	KkFOYL7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbtX-00000006vhP-3SGG;
	Tue, 13 Jan 2026 10:45:03 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbtV-00000006vfb-3TP7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=m2C1
	Cq0R3bvdmMZOqB7Bn3CVMUrTKnWJxHrygGNnHrE=; b=bTwKlxI0nNgr2gHLIeSB
	hDI8XILoB+81bZJ+jIufbsZhBJUuEzmD0vh5h+s9IvO7roXyWaEULZ7Wn79e3tZN
	in9xNMNISPenr4zopohkNIgTmUXV5kVd5Naaxc/Q+RkmzEj0rhg6aIpiO2DM5+Sq
	G2MZj+FXPLVXoEliD3QywcEJ2j9O5lUCV7w2AVODnlPdN+3v//mswbc39uTttSta
	rJn5n8o5kAKnugMOZvIHvbsx1Jrj2UzDhtJwYpPzRl5Az2uRstgYvdFvudaWXdZR
	B/Ijw+Tq6rUSmi2kZ6fTvMXr/5iH+i83NRWekmbXSSfCLOD5Nrp9U1iz7SZpS5l0
	kg==
Received: (qmail 1645245 invoked from network); 13 Jan 2026 11:44:54 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 11:44:54 +0100
X-UD-Smtp-Session: l3s3148p1@a+yNrkJIftoujnvx
Date: Tue, 13 Jan 2026 11:44:53 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aWYiJbtueA8g3srn@ninjato>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_024502_137528_8484D0C8 
X-CRM114-Status: GOOD (  11.19  )
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

Hi Bart,

> can be *revoked*. To that end we need to hide all dereferences of
> adap->dev in drivers.

I haven't actually tested the code yet (but will do so this week). But I
already want to feed back that I approve of the general concept of
abstracting away drivers access to the struct device by something we can
then convert to SRCU in a central place.

This mail is to discuss the timeline of these series. My preferred
solution is to aim for inclusion right after 7.0-rc1 is released. That
gives me enough time to test and you some more time to address review
comments. Bold wish, but maybe we can even get dependencies into 6.19
before (like the i2c_dbg rename for the saa7134 driver. Is there a patch
for it already?).

Does that work for you?

Happy hacking and thanks again for doing all this!

   Wolfram


