Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55598C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 23:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+t/GRCAwSF42wJi2sjOuZkdNg6YgI/3zwyHdc7PNqS8=; b=CVpbv1KzM+0wm9rqnNIOhF/9xU
	w19U2c1alMZVfQHpLlwu4oWkqHgTWPiiZonEX2Jm+Bi28tBQpWyXtKKY0kaZlsL+0dGlVXWDYzJZ2
	m3UkNzRi0fBhg03xSi3uwpd1BiydPbP4lmd+t69HyJjaFB4kumn6Sa/MtV1s/n5Lk9G3/Bcw4C9C6
	5rBY+cRkj2zmTt6pL7V/HOIkzfL7qjFCAs63dz8iwiwewY/M+20gjW8HFU/9OUXto/GrykH3diOhH
	R+RGqzNn9o+k0kdgI+NNH1BhqF+o7eDgfzRfiIzVjRJ/jgGX98DTIR5KKQphyc/ZBXnAR/Ql3nfVC
	kbN9aG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwpif-0000000AfUp-1wBB;
	Wed, 19 Aug 2026 23:29:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwpie-0000000AfUR-1oZ0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 23:29:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8826A43EBC
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 23:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4161F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 23:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787182155;
	bh=+t/GRCAwSF42wJi2sjOuZkdNg6YgI/3zwyHdc7PNqS8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O2RJ7MpQHiwPRjeoq6uCNd1ZYkdycmUDt/r3oaXlPxPl/y9QrvDFG2OKTKrYFkQE9
	 6N6y/v+eLfB0F+BHKrOQqNtov7pO06xadDBgOCZIXXXHPVQf3sOY8Uf1Ckq/bvAZV4
	 NGVLSMr7uGJnlMYHCiQhbnqliJDpXMxkIw7wp51MjCgcgehmTSXjTpNg/Vjs/j2SKb
	 QTD+xabPpKUsLzHGSUFMyr6bV4TWxR9dWP/f0RVXBxAD3FUQcga1yFrFKgHGZewznd
	 6vR6JTsY938gdCizfpqUaeQKrc6KFO753v84vNxG5J8viNXgyT12RIjh5sNCyrlOq9
	 clo5+HTuvQHuw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so1501693e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 16:29:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpAmrX70t5JczlUGIRSdK8CgTorF96fnLdc8RKLS9YNLxNSfGEDJmjaHQNqZf0rzf9EU0bvh1RIbX4rGx0pMMs3@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2P8Nqe8nSAX728NUOs4TsrVbM01yLpiNj+hVyTgPc+nMRRUGk
	0N2e6Gn1LruU5u7dF3djX8bynLmnys0xaU3ME3oQuHMBzlrIsjYcsbKahr1spJ+ShmHsdzoCUUF
	zaVf+KBtTePtUbFpEXvq0Sq6IBI4kOaA=
X-Received: by 2002:a05:6512:3ca0:b0:5b0:c95:cdb9 with SMTP id
 2adb3069b0e04-5b478d01111mr3368058e87.23.1787182154248; Wed, 19 Aug 2026
 16:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
 <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com> <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 01:29:02 +0200
X-Gmail-Original-Message-ID: <CAD++jL=VLzW-4eB=izJwaTJ+6xObk9+AQGTDK6ABdrGX4K3vAg@mail.gmail.com>
X-Gm-Features: AcwNN1Ur7ujm3RlAIw_lPfCX_YRoigqa7hb3ISujkLyge01WaVNeGdcwWIhysPw
Message-ID: <CAD++jL=VLzW-4eB=izJwaTJ+6xObk9+AQGTDK6ABdrGX4K3vAg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Doug Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
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

On Wed, Aug 19, 2026 at 7:03=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:

> I appreciate your suggestion of having a separate node for calibration
> storage. This feels more awkward to me than just giving up and having
> the bootloader hardcode all known device-tree paths that the UFS node
> might be found at. That being said, if everyone says that this would
> be a great solution, I could try prototyping it. The trick would now
> be that the Linux UFS driver would need to be able to find this
> calibration data, so the Linux UFS driver would either need to be able
> to find it at a specific hardcoded device tree path or the Linux UFS
> driver would need to search the device tree for a specific
> ufs-calibration compatible string.

Can't you just put the calibration data as a custom property inside
the UFS DT node? Just a long byte array or whatever it is.
The driver would certainly know where to find it that way.
I don't know who or how it has to be put there during manufacturing
or inserted by the boot loader into the node from wherever
manufacturing stores it though. (Assuming it's some calibration
added at manufacturing, I don't exactly know what it is...)
If the actual storage place is in something the OS can read
then we could probably use the nvmem to fetch it live?

The calibration business and what it is and where it is stored
evades me a bit...

Yours,
Linus Walleij

