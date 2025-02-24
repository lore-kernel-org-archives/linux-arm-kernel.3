Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F3AC021B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeI+Szk8Ev23V8Kfs42+SvMV0rpgNmn98EN/eJAG0V0=; b=wFNqVZASA8HodA17EUZc0QGzte
	SFQ5Q84jMagihsHZUkCq5KzcBZ6sYYtjKDMpcuGDCcsiFE6eOwWgqjT6AgQduSf+pMfV6tpJYvB9a
	cLVah92qPu1nc+AwtEvDJFcE7Sf3UxTaZQQJy3KZpGeEPydkBl0Dh+YzrcXjSYNil6kVZ2pMltB46
	kOW1/Q38XPTzdoetW3sY+q2jc/AuDjx2vH7wJat1GPEkdD6484LOzscKGePjJryBBkVPvKXSHYEHp
	wW5T+lquEY4BFYba12R4yrQbfiCXy1pJ66RQjv2Jz0G0NSQfc1Q3Iq5Fwu5T8gyH6Y+rMQPuuxnzg
	m75LFf/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVCv-0000000D0aT-0C9a;
	Mon, 24 Feb 2025 09:57:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmV1A-0000000CyDQ-1p3v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 09:44:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E71F35C568E;
	Mon, 24 Feb 2025 09:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70987C4CED6;
	Mon, 24 Feb 2025 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740390291;
	bh=Oy30/9mZEn7bUDinnc0MnPc95uAajJprYdB66FJ2hCs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZzRW7iYPehAt4rl2l5x8kO9GrbI3DA+cEo6LuHgroln05qBr+x3k7Iu+UBZtGq6CJ
	 NZjxXQYOU1LX19IF0G7wVIBzhlGfaJggIV2co5mGNCNC4TYP13qC0dpsq3d72P0sAt
	 ziVbsWv3TTPCoAVh1dNAet91w8X01FmFm3Hu32FXF7BznloWziRPwM6MCg6iEaybaM
	 s5KVkJ/joeYbskA8UNWDmcxzv3j+PDdsNmXqS8QlVieRqFb2X6PlSjArl5HEiM5xtd
	 Vka1QE1vNd1iIusYL8J1TWHGVReDLPEnl8CRuIUJsG7Jt3Ezt0BwkAMtPLiVdgiIC+
	 hOGNJku6qPvBg==
X-Mailer: emacs 30.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	gankulkarni@os.amperecomputing.com
Subject: Re: [PATCH v2 10/14] KVM: arm64: Allow userspace to limit NV
 support to nVHE
In-Reply-To: <20250220134907.554085-11-maz@kernel.org>
References: <20250220134907.554085-1-maz@kernel.org>
 <20250220134907.554085-11-maz@kernel.org>
Date: Mon, 24 Feb 2025 15:14:44 +0530
Message-ID: <yq5a4j0jhe2b.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_014452_514364_46F3AD1D 
X-CRM114-Status: UNSURE (   5.41  )
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

Marc Zyngier <maz@kernel.org> writes:

> NV is hard. No kidding.
>
> In order to make things simpler, we have established that NV would
> support two mutually exclusive configurations:
>
> - VHE-only, and supporting recursive virtualisation
>
> - mVHE-only, and not supporting recursive virtualisation
>

mVHE-only -> nVHE-only 

-aneesh

