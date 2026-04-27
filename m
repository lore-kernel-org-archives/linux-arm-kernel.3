Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C4EFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 20:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQEQTKF6Ane8FSjdQ4dArHvWB3kPyNAdQv5Hh4WVCxU=; b=3aG2X/yybvBGc68d/M9OlRVJJl
	DdOvUocLVG67gaG4mFjPsCGzG1ZxJA84YAGFmZ8zyPwVNsMxbszLXTsVmS/k+WO9nTnXaPcs1fj0B
	q11abLjfcbHck2atYLid/GiKcFLMZpoGWfe+XBNbPjf8PpR07IVZuYcap+G79DdMxd9viiO7pfKOS
	JpoiNAKmlDKhPdD+keSp4hNwcRJZnTlYy4+Vrc+TiXkt0uua3HNjd0tYRrlCbmKsS2XVwKXPTsaWc
	4zqUChZrebg2KYEMXiI5fJg8h923dunK4kzs9H8yM5ofV6KAdOyZrSXY25s6sdCoKXytDrs0glYRA
	KNpfiPdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSbF-000000007vk-3Lrx;
	Mon, 27 Apr 2026 20:30:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSbE-000000007vU-3oh8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 20:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE8CA60139
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 20:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38CAC2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 20:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777321835;
	bh=TQEQTKF6Ane8FSjdQ4dArHvWB3kPyNAdQv5Hh4WVCxU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JpYow58Oh6UmQ6oQIR9k6FnDXQMeAn4UNotWUB8IhSKo6sdD5WOk4vTxxxnRYIi9G
	 g/kqJAe15f8MNyijU4NkF7suJb84IkjaTVXhFMIp9pvT2Mo7vWvjEcwrQ4lSEkXjhh
	 vVAXNN2L4tEDc05hXYVrsOPZGoa+NX2ZABfq+7ZnNr5UvfJCizQ2DNzp7OMH6fIloK
	 dYdiWYl2SUZV+cbeWcTxaNpIg3oRv0NYyGqv/u879pz6cl63GIOK1SLsIgyXHAZUGS
	 EkVRnse68NQ3u4s6b0+odC5EnxEf83QDGPteAEzrMEfJcbS5xQsLDHK8L9Ga6iJ0pR
	 vkDjUOn+Md0sQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38ea6a5a0b3so105369691fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 13:30:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+OeAfSwCiXszB1PvaYjdN7+kbE6hIDrVGxT+53eRmhC2dtvuLqKvx4JV6KW5YhsCr8iSmJO5NMR4WrsprTHuJQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzXkW60EhSmqRFE8XBgjkyP8TL31CcwMR9IPzRofKYgr18gvkow
	ujjOqfE4Ytye0CcfCUE1SU8ZvrUw1nGZylzMbTu2PAesHUg/C3twirh4A7xw78x8tDxQlxvLoPp
	cjBCUX8CbKsjFOVqT4EnBkFrDu6yir1w=
X-Received: by 2002:a05:6512:128c:b0:5a2:7b74:3c60 with SMTP id
 2adb3069b0e04-5a7466143cemr122787e87.33.1777321834378; Mon, 27 Apr 2026
 13:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260427143546.3098519-1-arnd@kernel.org>
In-Reply-To: <20260427143546.3098519-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 22:30:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLnFimSnV+KhRq4kL0ADXPy1sNd_1vBViG6=kADOF4Sz0w@mail.gmail.com>
X-Gm-Features: AVHnY4IDAqphHkFYWq0uMk0MOZiHZ4MXXrvG-QLMzzb07r9LDEqh7dgnp_Ijt9o
Message-ID: <CAD++jLnFimSnV+KhRq4kL0ADXPy1sNd_1vBViG6=kADOF4Sz0w@mail.gmail.com>
Subject: Re: [PATCH] ARM: s3c: use gpio lookup table for LEDs
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, patches@opensource.cirrus.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Apr 27, 2026 at 4:35=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

With comitt message added:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

