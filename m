Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92314C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PB6e08EWlcYnnLEyvdrJxsH0lwpkv3EVQiwtaaaiNhU=; b=JYCA01znzvqlg/ZOqQcP4M0mh3
	6HfVU/8liABI6xUSJFYdOGGHreMmQ+0FqAaFZh+5YAhDZk259I8LSNSxZcQ/fr/EiMiZt+jIxKab5
	oY603eqQVBfL+rAe3DLtI24q0SISKvQ0O3w9vVGw2+TIHS2E3n5oZAMooCWH9HRqZ6Q/lBBFZCDtq
	qTi5Ier4dLKRXeM9IYWtN9KsVqGJMVfXALTsksOs/dN673HF2+OEM8KN+7gNd+ejyJQZtQSmxV5IQ
	2n6bGMdnZY81KVC7KVinYJkyyex1CfdmVrQfGxKRPzM25rOKUj9bMGFuFRo9shylULXixVnFjcnvJ
	Bz0zDVfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmVg-0000000BbyO-1eiG;
	Mon, 05 Jan 2026 15:28:44 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmVd-0000000Bbwx-2g9B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:28:42 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so336415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 07:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767626920; x=1768231720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PB6e08EWlcYnnLEyvdrJxsH0lwpkv3EVQiwtaaaiNhU=;
        b=kXeetpMuElrmUfi9IDpo7Q6CbIYffl6OZNt2TpLQSB7f8XgPCM4hjJJeZzoImIyxr0
         pKvSxFd4erRjE0yle4E+FiAN4YBYWyIw99a0ErWtWW8Ufrfr2aBH7pYL7G9O13pASFJI
         0NWsxTWACPcuFGZ5vzkV/e4iKih7c7qBgw74z18TKkzeXtdCLDHYawHxvPCe1LqGg3Re
         az19r9WYACnxMzoLA3GxuTkPNnXu2wKGj+VZOAykYT418ZMhm2L9yDxIlZJ2jp+FgUhJ
         XJQAjJOTST5xfhUDZentGUVi2WttnoPw4BCqL3D11yt0KeYKARaLiD/xKilCPO20c92P
         OZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767626920; x=1768231720;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PB6e08EWlcYnnLEyvdrJxsH0lwpkv3EVQiwtaaaiNhU=;
        b=Vr04G4mnG8umTk17YDOPenFoLh9xITm1Ld8BHMD190Ou43jGVUFBS/PhXcmfkEHmv4
         cdCcFU9vt3di1Jw9286DXSM3P0NYUPmRCJEeXaQJPGsDyhg6DfSa2/syWMY2XsO5lqOE
         EFmCnHZXGI1wMY43TiLo/MRNYWsHTgz/1v5CglLGxAqKMEVk+dD2a1yK1hqtK6xk1vhI
         ZzRw7UH88fc/uCVpZ3DLp89SC0pzTgh71UfwlKj/iFqW5KilBamUUBFFtXx4QLz1dOFl
         5Z16uilw6ZG7OfLSrhbBZGVVdDnCyMIpFG21mKdaCAJATr319OWlB6N+6VynaqqA4t3N
         665A==
X-Gm-Message-State: AOJu0Yw23oD9UI6Nyw13BuHuFXI9r9fcZ8WuyVm0/qmJQkQY33m2ymxu
	B3+TkNmuGoUti052I36IeqNe53WMRnljR3GxaiogHESw6af9Ijuw/VuWxpstHvhHYkU=
X-Gm-Gg: AY/fxX6usrqvmVgDa9bc1kLcmpzNsJWILOTIzwG1HLBuDeq/P6vvNtI31QxS/s8eDSb
	jOg47Q7820El/uD8x+6uZTX1GlUYxKnmJiXWw0xCTI+6v+BRuOuGTwjMzr/J/baRG4Ntl/e3uaH
	vPABTxn7yLunrvTbYRvc9RkG0osmj/XtSXHDQNw8+veZSNKoBhXMFGwbO0SKJjon2MfdALHrsZV
	vidUz1ACo+UjdHAXPoEusB6na1Ckxf6o3vkYSn6Uopq8oVqQlA1YRoXbfoWPlf99nTgDtG/PvrQ
	zhZqH71cl+c7KYW7szeqbbXyVA88ksjrncqW8IXCL6X2c9wugOEEOswU/yUnEBBUBtgWg1MyIxD
	g+ijQGZjcOo45jhZ6ZEw3kXb1swSAWdbqjBOgRZLIbvDu6Ug/1704UtpmHGlxS1GcRiTr8BfLqh
	tDOF+eDNz+BemyaCvOlDB24jsMy3t1ou8=
X-Google-Smtp-Source: AGHT+IF9dg3EzRKJCUJkIpaOYmPDVUtUlHUdtyUXwFpDzaH40VuJcbLqERy5ln9Blgk3u+fx9gjH6A==
X-Received: by 2002:a05:600c:1550:b0:477:7991:5d1e with SMTP id 5b1f17b1804b1-47d1958b250mr638504575e9.25.1767626919903;
        Mon, 05 Jan 2026 07:28:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6c0c148bsm58247155e9.18.2026.01.05.07.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 07:28:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 tobetter@gmail.com, christianshewitt@gmail.com
In-Reply-To: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
References: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v1] drm/meson: venc: add support for HDMI DMT modes
 up to 3840x2160
Message-Id: <176762691920.335654.10635601419658872459.b4-ty@linaro.org>
Date: Mon, 05 Jan 2026 16:28:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_072841_688652_52345689 
X-CRM114-Status: UNSURE (   9.71  )
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

On Sat, 08 Nov 2025 14:42:36 +0100, Martin Blumenstingl wrote:
> Commit 5d0bfe448481 ("drm/meson: Add HDMI 1.4 4k modes") added support
> for HDMI 1.4 4k modes, which is what TVs need. For computer monitors
> the code is using the DMT code-path, which ends up in
> meson_venc_hdmi_supported_mode(), which does not allow the 4k modes yet.
> 
> The datasheet for all supported SoCs mentions "4Kx2K@60". It's not
> clear whether "4K" here means 3840 or 4096 pixels.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/meson: venc: add support for HDMI DMT modes up to 3840x2160
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/26ce0b87a815c71d24fd193a81c06daefb60959f

-- 
Neil


