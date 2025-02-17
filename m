Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9336DC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 13:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZY5+MxpkCm+wbQpW1TRwuF9fogTCzc2MTVqMxBIRjE=; b=MU7Sj4f+McvUo7CIUfREBFdG0J
	7F2mtN6TaI9JPSGsikY1pkH80ZzzKdRo8kzL1S7/UWRyJ8mjy+t0dqrcOkjA0xaW6RZpif43VqoUM
	IIV7k2CxEdUaHrMWZaXvEVRUyTEcWtUt5C18PCMsokFsPh0bgG6axJOqdcrBt3F6Ix1tg0l8siG4W
	ujC9X+/QxUcNCpnnBEY69ZYGvTnwiwzOhNdKXbZcPHV2ht8kgowkHg5G3OW9IeEs79h5aNeZkjkBx
	zctmi58DShPQsojXZGi6tqyXxKxh1qc9LxnoP9RP0GBbPexU1FC5iDHgdwU4dHEyuwGX4al1kMx08
	ThY4NT7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1Di-00000004fur-032q;
	Mon, 17 Feb 2025 13:31:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk14R-00000004dbR-1xeX;
	Mon, 17 Feb 2025 13:21:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fZY5+MxpkCm+wbQpW1TRwuF9fogTCzc2MTVqMxBIRjE=; b=PnFBkOepghRBdQygsYGbaSfW/X
	QoTJhDgJtPC70c9+BWIeJwgFteDAR3cGxKLTrc3ctE41LQsCrROdRH86plskhVdD6I/e95OawD1CL
	XUA5zoRxgMHuIqwMw7lx5+aJyfSgjInlllyrKdnkY5MmclKOguSCEEiWiP3sUX25+Roz+dk3grNTV
	t6v2JwS1bneqv0jy2X96upvlfTDVKXiG/d7roxktlLUjidZRVmrG621KoPRkYRhQ/Si7jWLh8C2NG
	44DFx0s5oomhfAJ/GO6Pmf5NaXcwHjsi0ziL6F8j7VgWlP+P7AwimaR9w8P0kve2oYOrk4hR8br69
	SXydsv3w==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk14O-00000001pcu-0dQs;
	Mon, 17 Feb 2025 13:21:58 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-220d27fcdaaso10755795ad.0;
        Mon, 17 Feb 2025 05:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739798513; x=1740403313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZY5+MxpkCm+wbQpW1TRwuF9fogTCzc2MTVqMxBIRjE=;
        b=i6cz/Jv+j44yHaM7UlC8Td7t7gieOBUQhV2vlRUIzvpsuhp4fKrsHzn7Tz5+jJPot4
         Trgr6unFr/ZnjcQUImUWCBijPzrfUWtxN0nXrija0OTTQUE5aZ5G5h2ULp/aMfMR+s9J
         NY3U8wbhm+SyyAhMLxM4qU+q+yg/k11M9EsYCrvf8uw1Wwqg4eAJwCcbpQOeMUk/8eow
         bxvVOLYpewL5Zev5ccQMzSx0UBwwxnaqgB7BmrFjLOYyT1x/45T5DVAANwOsgOQ9R83W
         JjwqN0uTaWBoDtKxpyCblUFYuSNvl0l8EMalLYAjznS+n72ZY5a0HlziJYieHJ2BHIQZ
         W7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739798513; x=1740403313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZY5+MxpkCm+wbQpW1TRwuF9fogTCzc2MTVqMxBIRjE=;
        b=t7NV66gzAETGQr9C8zBoIFP3TM5FAS35qixD+/go5fkNliWabWCkxx1qg4mb9niDbC
         vdWENx58XzbOBb3DhrjuhEyjSgXqFMqPGVp9GhlXQpDqojtlKD54LpASHjor+B+k9hb9
         31gaYO4af+/o4avvJdbl5hG6uXCMGhDPlHE0NjQooOJZoDKHTD8V+ZYpRDhqilA3bUEi
         /yfI8zl5SGJg3arbjy49K9bL6TjFz8uXaugFXJwuFuEW+lr6DQz5+kbSDFl5m57pwZLl
         36f0qyLy1oYMSJ3TC9x1umTBy8OaIrpPWBNFh+dxrKWXl+Hsprvg5HKbH9JrEurGG7TC
         Skyw==
X-Forwarded-Encrypted: i=1; AJvYcCU3KSAB4r7uiSUtfoLiFWOIOkuQvKfkjRJ40ZQyTO/hREYfDasT96Mgfh5HVolXy9gvPz99MMtYzFtBDGYCC4U=@lists.infradead.org, AJvYcCWV7wDKKE2dO6fLjCxyZ/qjLljr6eVjhhJj9muauFo+uLomKIyli1mhnk+JaHjQBvDhuEDPFOjKH/fYLgM+/PGG@lists.infradead.org
X-Gm-Message-State: AOJu0YwFj42g5yOHP1+VWxx1bJXCUEfNc13BPRigh/d0SLA5i4QZ5D7o
	ZW5+CHP7/LE615/NKpt2ripYtfYG2eUPDi3tTROuPS2GVmAKpMx4
X-Gm-Gg: ASbGnctocEZ6XBrohDuul+eIbn1G6LtWCg8QREBw7osK76o1wvx9NamtVODAnLWY7we
	IBem+P+yWc4QJSewFFZBDFwSSvUtODMhKKSeLKLVf8hiqFRxPFABVy41ifkbdkIhOqECUa2uzWB
	jy1FyvGur8d/d7qjP1Xr2IukgvYi7WRwq6l37e01qXblaoaQxgPVSEs2VYsJTGeRPHeYTr5USPU
	tUUL5UrIceGvvfhbbusH7RZ8qHHRc8q5frSqtrMpli3DH+gQHgumq6mTlO94PWkc7TXC2JHBbDN
	+LQCuzTXbW54j2GmyNau
X-Google-Smtp-Source: AGHT+IE8azzrvYuY9vtV+dztsz41c/YP2MD1M6ETGEr0TQOLWNYceX9noZ/t3S1swZw5I7fqL8kmaA==
X-Received: by 2002:a17:902:d507:b0:21f:795:8fc0 with SMTP id d9443c01a7336-22103ef20c8mr53951745ad.2.1739798513066;
        Mon, 17 Feb 2025 05:21:53 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545cf8fsm70994875ad.152.2025.02.17.05.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 05:21:52 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: piotr.oniszczuk@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	robh@kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [PATCH] arm64: dts: rockchip: add hdmi1 support to ROCK 5 ITX
Date: Mon, 17 Feb 2025 21:21:46 +0800
Message-ID: <20250217132146.604090-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <975CFBEF-4E37-41E4-BE3F-7294FE7E4D3F@gmail.com>
References: <975CFBEF-4E37-41E4-BE3F-7294FE7E4D3F@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_132156_353786_88947F71 
X-CRM114-Status: UNSURE (   6.63  )
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

Hi,

On Mon, 17 Feb 2025 10:48:00 +0100, Piotr Oniszczuk wrote:
>I manually installed it on my sd card and sill getting:

I have built a armbian bookworm minimal image, you can test it in case
there are hardware related issues:
http://cdn.haguro.top/share/Armbian-unofficial_25.02.0-trunk_Rock-5-itx_bookworm_edge_6.14.0-rc2_minimal.img.xz

Best regards,
Jianfeng

