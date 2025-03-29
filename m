Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD60C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 19:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JFz+j+lYMYpEFRAVVmF7Pa4RWjE2uLL9dKkNgmgdtZY=; b=0MJ4YCsjAbepIN0aPpS/G8Dzf7
	SRjrwLP0P7mJFPIjHHJH3T12qYz4eMkPYWQALYBZy8bNrDRKxISFEFSzVgtHVAtxLmsh0pkqaen9z
	tmGOiy0jpxVMNk4Y9W1lSgglRRLqKjiYT2ZDbzrqIKZRVt2G/bNK11aG/qg7uWctwNtWrFkuQ8oLv
	8ji0zfAFK6Q5ige0AJF9bGd9ysKwvEv+SIYngjCjna5etGcETI9a4UK/cLFBPP3hbG9+yJBgLRjce
	U8YyLRQl403yoDHl93zA1IOADpBn4Xv0iI5G+T/pwOzte6Q1WWHnP7LC+B07Ek4cDhlbgyXg9k9uc
	SSJTxMVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybfv-0000000FRxh-03Nn;
	Sat, 29 Mar 2025 19:16:59 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybWe-0000000FR6s-0m7S;
	Sat, 29 Mar 2025 19:07:25 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso5365156a12.1;
        Sat, 29 Mar 2025 12:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743275242; x=1743880042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JFz+j+lYMYpEFRAVVmF7Pa4RWjE2uLL9dKkNgmgdtZY=;
        b=UN+Vh2tJhYkLoeYqcWSFu+CyHLn6kKOohg8D/2i8pQjmwMAH1lg3WiLINmkZjEYp5p
         aDArbtYL9k2HtmynZgkP5+lZyiFzBQeR3EZSPZNgFYPDCQ3f8hhLfxQQzDbmZwQ6bcBP
         TdK6ZMjRGBoKxjyeGRV0cQkjSzZEKcerJXlBb0IYg41LeT9HnfvVq2SvYO1/QeyZzBza
         Fw1wIsGoI+KWZNk0FmpSu4tVC9AQx2MnATvQV+pmD6KOJkuC+ujvsYJQRtKq8MrD7nLo
         hyz7MDtrC3FLrRvEkcq/ZzK7OI4YlgNI3UP5sNBsCbcmem2fE098ogqGVytR/SvjqTcU
         WNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743275242; x=1743880042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFz+j+lYMYpEFRAVVmF7Pa4RWjE2uLL9dKkNgmgdtZY=;
        b=A9difR7SOpmimzo+NO7FnYkqtmVxLZfuEfBXdyKenN48+PlXO+LS4/c1jKs7BiaZSZ
         tBAD7D0hp7Bm4TakjX8LRLYErmQMl9KA7sDjL7CBFgSAdcBg7AYFLw1d5Y0oWlZC3zo0
         MY0OQFQQTvBYXYR15xcw6rPfDVpXC21Ldpo7/MKzDofKCDqeea7bnwhTzKq+8GH/mYQ8
         cuBfoqcV15/FqfHqsBtrrAGYRI8pqeJ7I+wlAoI7g/HZNpRbLutAYbhPsb0awurTqPBk
         +FkGbnuiWLd2FQJzDvmN7aXwpxj3sZs/Uhnl1GF0FyRyViBu+HkB0oSVHbzOus2WgvCD
         Vw3g==
X-Forwarded-Encrypted: i=1; AJvYcCWZxTsiTlafSrWtDW+n04tMe5+V8GC+n9szusCVtMX1DnOa4L175nupouDunyP1uQxPlvL6Rlcbt3Sr@lists.infradead.org, AJvYcCXaO1pLpOI1rl41Trra8LAJyHy091t+j0WkBvrwFZYnQb6nqcTouc9CL8jabah8wy8RaZmYHA9RSLNEK6XbfkLD@lists.infradead.org
X-Gm-Message-State: AOJu0YyMeKo1zIgsCYXwQoy5nJ+4oYfd85Fv8Q0Z8ZQduQ1UUlqbu3de
	zC1mgJp3a2iklXsydV7cHtsoRnkmnCtf9wPPRqIxt1IVhwnasBZmC5t4jw==
X-Gm-Gg: ASbGnctvE0eK9Y7A+eBt7xxNy/HCznK6XLePcSaRDzBNcVn+VuBlLUW+hvfpcquKmuc
	yI4L0o4aBDNOvf6a7C6uzd6RssHu9h5KWloRJXJYAZ1U/DhDhLXU36oUnMlUTaayxcwXACn42m/
	RU1mxThIdj0En7Sd2ad7ohI2eHSjr1e50iXhOvzK1KiAfjAraKHOc/IJzUwWjtAOfqFJaaGgxZ/
	qvE/DdajEZT/ivwkkh7XXUjrLGM306u4aN1bTV7pIkL+jC6FjXJKQn9NPDX3OYcVQTDW4zJELg/
	d+RgSCAk6xSfCaidoQmUSpNt8sbZNpIA6m3/GYgaiRsDCkXhR+hrv162wWWx9r4x3TtYgSF1yXQ
	EJE8oj+phnUA53zxFxixwHYdr65GYPbLtMbZoGtA+YW2JaCmmyXvnN9fd3psJYSxYuNtEmFxjQc
	x5TWUe
X-Google-Smtp-Source: AGHT+IEQ+QO1md8dITwHEJCHRkLxJT4UkzUndN8TnSWkTxa743bZesp6vBpeCuGkIGe8sK7LVrQqww==
X-Received: by 2002:a05:6402:35c6:b0:5e7:b02b:6430 with SMTP id 4fb4d7f45d1cf-5edfdafb282mr2585993a12.23.1743275242058;
        Sat, 29 Mar 2025 12:07:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16aac05sm3275271a12.3.2025.03.29.12.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 12:07:20 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kishon@kernel.org,
	vkoul@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/2] phy: amlogic: meson8b-usb2: two small cleanup patches
Date: Sat, 29 Mar 2025 20:07:10 +0100
Message-ID: <20250329190712.858349-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_120724_222035_C8CF0F59 
X-CRM114-Status: UNSURE (   7.31  )
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

Hello,

this series includes two small cleanups for the phy-meson8b-usb2
driver. There are no functional changes.

Changes since v1 at [0]:
- added Neil's Reviewed-by (thank you!)


[0] https://lore.kernel.org/linux-amlogic/20241231191718.2764065-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (2):
  phy: amlogic: meson8b-usb2: Use FIELD_PREP instead of _SHIFT macros
  phy: amlogic: meson8b-usb2: Use the regmap_{clear,set}_bits helpers

 drivers/phy/amlogic/phy-meson8b-usb2.c | 35 +++++++++++---------------
 1 file changed, 14 insertions(+), 21 deletions(-)

-- 
2.49.0


