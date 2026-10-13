Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95757CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHv62jhll6vjCk7xDTGv3L9j7vvvleMv+b8f2f75tno=; b=WXNX2pYzAxpM8CLbrEAiNHwZ4p
	KdqFCyMmOjhaJQJGCymxpSICfCaIHlALejYUArM+ZiLn5xFoVoRvmNUfsz33kJ0iCmQWiDG2qtTxl
	SHsJBc+qvO49cb88AivlchVQmr2595Rz3vMcGGXN7c9r+7BnMQ7KARXQzOSHmDl0ascZpHt+eMt9i
	B49r0VBjheYX0H2MrWwJvUiqmA5MCFIxdFTeDnDHtvp2h2F5N2G3DtR5QMUsye6JBUsPQED/fjANE
	C8EWTYCK/QQu7aZTWWSLkFKkQavIGuPPxafhTmijCktr8NJwoLm8/mjGSXH2vR8zJe62wrDQ+KNn9
	Mn2s+xtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYTt-0000000CP6g-0aEZ;
	Tue, 13 Oct 2026 09:07:33 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYTq-0000000CP6C-3FTc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:07:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so22113065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791882449; x=1792487249; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHv62jhll6vjCk7xDTGv3L9j7vvvleMv+b8f2f75tno=;
        b=Nwp3VX7DRdCg+UB36eQs396NqT+9XuoEWex9Zlb3Hp0GS64y1hVzGuCvm1RiMLP4Jm
         CQ+tEE0yd9GCVtwmUlQs8Un0Hy4kLO6H4yx4KWJD1Oqgdp6KxQL8o5YJ5GlDI8jMbALR
         fqDUfCP58GcZ0Pff1K106bq+u+FnLjPU1t9tgJinZkz8f/BXLsR4vkfeJOQfWMue54PM
         LTKIiw4s64RWZHc0R9yWpWDvO7XHT+9R6UKLQoTYHAuc6+pZf/cIt7k/SDNON+rNRXUZ
         IqCohOHmRs9R53L2ZxJVGc5V3eax7rhAwsyVuW06zqbas0Kp1e1MUuCRNGdpWzsFaPK5
         mH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882449; x=1792487249;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHv62jhll6vjCk7xDTGv3L9j7vvvleMv+b8f2f75tno=;
        b=RWkm0bPK9jxF5KwH+0aXbyN/uR7wIV6TUc3edfXrsyp5OpjUj81r+DZay5Fvo1WAvj
         Pd9Q6cY8zjdtM08qg684SpgQQ5gKwhH5FLdnLQbcV3GVLN5sY8B3qWmGnO25GxlFQzoW
         HRaShmMRRsthAJsrwRwCvdJ/Qre0LaWf0zT5ZHXh/GD/7OG1S1wcFEaXRt5oXFPcoK55
         Oq6v42zDCA5i6K0PFeCaE/DzMSHcCApvDQid/61hLzOpq2MPPVAaYwk717p4YPDQ40ih
         ny74/YMo7GIkLxtAfXTvmG3VAU2yYEPxcr/KwTqc84LWS7UAbjLkVk+km9CaHif/t+wa
         hnQw==
X-Forwarded-Encrypted: i=1; AKwUvByFxvX82mR42dkj5T3LZLsm2ABcRv05rttXD2BsvD6k33tigfunieJgPo+tx8Grp2Lqkb99Gi15ZWAMzIHmPSoi@lists.infradead.org
X-Gm-Message-State: AFq9FYKh6LITZ+o8zXLSzFZZse6k+FwheRaf8vD8Ajz1YJzTVH02zimG
	toC8K5f+CbwRWZMekci8OUtfnrLi6KBundJ3hMMfk2p8/oLZNpx4Nbtf
X-Gm-Gg: AYBFou1O/tkXC0qnEncfnisCrYyUmxlN3szKlST/cU4OhC0nkgdbZU2hhiXf4tYkn6y
	f+qnsFEVjjHAxt2IW+CZ0RbOlnVWQ6+R7ScoxpAIdjr9gp/eVOnJMOB9+e6c+W81xbqw8S6gm6p
	slS82+g+6ujqrQVbww3FZJNIvf87M0tJYm86sHySvWSzAmXDsrd92MZ/2FC0Em+2jacDA4G+BIo
	5q63PfNvGhCX4ujka4RDHrHWHMCMOUS2gxomMxpHqCQ3afQPEKgDYFBcz2eZQpAmalxq2EpAroh
	dzsovjYcofJz7Wj+6qvrmyVQp1XrbXoz95YZXUoWIJwLuV7VkkcKZ1LSzhp01oHqG5/DJegCtE/
	CclZ64DJyQViZWZcKopMuZWGOqziLqBZuEMcG3jIvt7K0KqWapU2yeGbXqXWG0TuYc08YMfyCO9
	4Y0btSL8nNfXzIidZrgBrerDiV/Z6qFbNbb+4jRhu0CzzfRmywdarintFoZaQmqNsZH6YNR68ul
	7Kwyf4pV5ZkKlWmrbt7nfHmD3ED+CQPhZ2hoq/m8mBtaF4HycU2VvcjuQ==
X-Received: by 2002:a05:600c:3e07:b0:4a1:a009:9724 with SMTP id 5b1f17b1804b1-4a1a00997f1mr85302755e9.7.1791882448859;
        Tue, 13 Oct 2026 02:07:28 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf31b83sm360478255e9.12.2026.10.13.02.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:07:28 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jason Li <jason.li@cortina-access.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 00/10] ARM: Add support for Cortina Systems CS75xx and
 Securifi Almond+
In-Reply-To: <192a1f7f-79e6-403f-9910-d46b871cae2b@app.fastmail.com>
References: <20261013-b4-cs75xx-v6-0-37e8f3969b7c@gmail.com>
 <971b67a9-7e3a-4fde-a8a1-e5a78f8d6436@kernel.org>
 <179187343453.3124451.12229499654368455627@gmail.com>
 <192a1f7f-79e6-403f-9910-d46b871cae2b@app.fastmail.com>
Date: Tue, 13 Oct 2026 12:07:25 +0300
Message-ID: <179188244540.3423842.17952003148776663506@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_020730_821672_0959FBAA 
X-CRM114-Status: GOOD (  10.89  )
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

On Tue, Oct 13, 2026, at 11:04, Arnd Bergmann wrote:
> Please just wait until all soc patches for the 7.4 merge window are
> upstream, I don't think anyone is going to look at this before
> then anyway.

Will do, I will rebase on v7.4-rc1 and send the next version after
that, with all the comments collected until then.

Thanks,
Fil


