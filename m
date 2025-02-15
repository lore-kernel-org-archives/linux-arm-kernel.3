Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173ECC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 12:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CKe4QYdGATEkp08y+n3JYFYApI5cWyhfV2vUJ+ZTwQQ=; b=QHjN6C4uylbHMDXDtnKi5Z+HaX
	lO2n4CdUYuIhfiMYukf8vCnKyCHINCAXOLfkvq0ys4PlR8LTvcffOQyr/BpgalGWQi4fXNtg+VA72
	6w2pp+paIqS+h8oFaVIgrbPt5uW3G9dzy5a+Gu0Lfxztz5qSaicHErfFp/mG1b0DP1d5Xnjzs3WUx
	kRzwV+BTKtPJGIfN28Q92HN2quuYgj+lPG6wgGjTCfycMftAm8SQwh4kbH6629fsaBmt/cvTv7Rd3
	u4b8vvxvSsZc1GY+oxubCIWVH1CreRHUBEOqp8rnVG3/3Ppsg19aeo8/cKcBrHY70koFzgHThCEL+
	8ycUQ5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHPI-000000003y6-1yTA;
	Sat, 15 Feb 2025 12:36:28 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHNq-000000003l5-1zyG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 12:34:59 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4396f579634so2618825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 04:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739622897; x=1740227697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CKe4QYdGATEkp08y+n3JYFYApI5cWyhfV2vUJ+ZTwQQ=;
        b=Pld//LcqmLPe35kXLy2uAtbD3fWZ8WEE43ttu5IwMp5xLqNVzOb3rzZbdulMfVgppZ
         tyX/p6WSSmR/b83JI5r7eB82hwhIvTknAusULm1zwmHmlGyQfDlOvPjdOlAVOQYyntcv
         n3danNOuC8RihRqox/FS/LihHY1s04eSO3OHCL82Ycjx4MXCS2B9NOoaGf+FJLWxN4qy
         46zIfD10A7OIzIg4Gx3ebisbUVVmsFnPorlQUqDpVU8Z0oe0g3utG44M8F/5kyDTI0V2
         5JF3RgUgWOaUjpL6y6bEIuOrkP5cg3jpY2nqpEuutFZtxibBtFyd6LMaSFtKxz3ujlFe
         3qiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739622897; x=1740227697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKe4QYdGATEkp08y+n3JYFYApI5cWyhfV2vUJ+ZTwQQ=;
        b=cZLmMwTKpuZMmbP8+YPgdlMdmb2rc5FdBn3NdSVb7q8kMgBG43MlaW7EIjx5EzokG7
         8XTt2Firf+EYLDe4z6nt7yuasacGPOEkTIegfiZKXKaQpAgAmDxvgW52IAfh5p9n4nt0
         IOxk2JQSHuxUOc4K9ERzsba5gqiDMwPRM2SjyoRcX8Fu2aZT/Zi5Ev6I8zavvy9lPkX9
         Yz+uI/6cR+5nzjq3Iw7FG8riVAsv9/KWUcFqMYTgicrdXSfHZxoGi9sj5663EC9fMkSr
         EeZDiYkus8YOQws+VuYgqZ8xaA9zoAEInOrYw9UfSuP3y39L3S4gpXHk+X9FKAyEdwiK
         LH6A==
X-Forwarded-Encrypted: i=1; AJvYcCXJ+BiWRKdgB8FQcxtRHcm58mTlYRAj6G/iYJbIJZjO9ZqD815Fp67fLotwFh9GMqW0OGhOFe0Trijt3HrqiCgd@lists.infradead.org
X-Gm-Message-State: AOJu0YxGU6RId6BAhtpJ9gYp03Aj7sjlczFkkXGJfWULdgzqrYLX8F0R
	E+vy+QWHZEhAz0iTe9AJDmA3Mj5HYBnhyVhk3ymqj+YtJRBZKkgIwQf9nA==
X-Gm-Gg: ASbGncuk5n2qYh+vYIrp3+NCt1d+mU06E9MnpiBOj4vEJP2bE1DANisfUhrbSqxYhTK
	4Qw2Zt43gJd3AY9j8fJwuOXwSPTN8zP4uJH/LgwNe6DlZMso09HtD4yPCFjToo7lWBA5PfrtMy5
	785XFa8SHdvfNGBsMDz6OKPHd/CPK4RETooOLSH3VijsKGu2dQYxkTzfqela7iKr09EeBj7nW0d
	3bOWqtmtsCIUlIJA7BbnEIazMT0W8resGjtMa/p6tjXrz/sYkaFpxM2+WtkP3yxjPRuWa9R9uR9
	eYxGIGLkpA/0UPyk4zQV0267kfsz91sJG/LqSxW4jmTPXrUTKBXOETlqqjqky7Ht5e0=
X-Google-Smtp-Source: AGHT+IFUBWZsXU82RxSy96RoGb0/0g4JAb4YfWMt6GwiDByMiJh3slbtaSZj/gS6aBzPWbV508Vxgg==
X-Received: by 2002:a05:600c:1c94:b0:439:685e:d4c8 with SMTP id 5b1f17b1804b1-4396e6fa130mr38307765e9.15.1739622896632;
        Sat, 15 Feb 2025 04:34:56 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439615e543asm70846685e9.0.2025.02.15.04.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 04:34:56 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] usb: dwc3: exynos: add support for Exynos2200 variant
Date: Sat, 15 Feb 2025 14:34:51 +0200
Message-ID: <20250215123453.163434-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_043458_532164_91D06941 
X-CRM114-Status: UNSURE (   8.94  )
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

Hey folks,

This patchset adds support for the Exynos 2200 to the exynos-dwc3 glue
code. It takes one clock - the link_aclk, and the dwc3 refclk is passed
to the dwc3 subnode, as with gs101.

Best regards,
Ivaylo

Ivaylo Ivanov (2):
  dt-bindings: usb: samsung,exynos-dwc3: add exynos2200 compatible
  usb: dwc3: exynos: add support for Exynos2200 variant

 .../bindings/usb/samsung,exynos-dwc3.yaml         | 15 +++++++++++++++
 drivers/usb/dwc3/dwc3-exynos.c                    |  9 +++++++++
 2 files changed, 24 insertions(+)

-- 
2.43.0


