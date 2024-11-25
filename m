Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B66D58065
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 11:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atTGdQENg6nCHWrmtf7VN4oYXAt3UDEdIH0WpKqyH3M=; b=ytNM5rmqKEsxtbAtMc15RSBm18
	8GWpdAKDosS+XtwGOu+9b0MYA/U8flcM6VFRbTAPQt9MnwSW+HeSLA0NyAFOjYjZE2oMhGYqv4GQ7
	iMP+uxg848BVnvU4K/g4L5eLOwqLSjdU/VC5dlw5uEC3jhhnfhrevnFtaCUlNNWMnCIoJQ16znGMK
	2nZeWj3hs8RobIChI/rSofUrndFEjka70WhFXgs0PvUxL9BJYHiPhvG7csM+KP/yEy5WwYHtVrgmd
	sEEqHQs8SkktZRVEiEDI/P2U5/Neqag2QqP5yfj/AmUTYujayi3fjHLbdwq86FroaLRSNFurAWpcD
	1sfClLXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXEI-00000007sup-0nGU;
	Mon, 25 Nov 2024 11:26:10 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXCe-00000007sZS-1Ne8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 11:24:29 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e38232fc4d8so3722980276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 03:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732533867; x=1733138667; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=atTGdQENg6nCHWrmtf7VN4oYXAt3UDEdIH0WpKqyH3M=;
        b=Z9JPQwku/1qi7EtywDn9a25UZiKIrWaAkGoZu8Wikc7qxrfRXVEyDzgTw3VDlqKNZi
         99AWfADHeL4noeLsFA3pYPdhIvPPDV6sk9+QY06fs+0BXm70g/fKDIyAoAl5r4i/jG0r
         lTH9V1TIWVbD1p2rIADpUjg0XfaFus99X8OOLbpp/K4Zs5tEhUK5TmG6ju3v3vmaouyd
         Sz8T3X7f+e4tNJXXlEbsDgqXEgfQDafqZ/1UDawTAOBuwqtSB1ZJYJh8u4bnPbgwmue9
         TQY/J8pOhlwkOhDa0GmxjpxUbhmFQZTvNbCJcOHSRuqva9fYtssTgaIRKPWKjpmDXI9M
         7jdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732533867; x=1733138667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=atTGdQENg6nCHWrmtf7VN4oYXAt3UDEdIH0WpKqyH3M=;
        b=SEWYF9VZ5jvcyL5QlSY5gJT8Y1Xi6MzXMFiPafQpe2bZ3twE2IhfjjvDHANXP2zIfe
         pwT7208X3M1BqaOsPJ9jXTq4lbvyngRZVh9CJiHPfhG9PjivFlHqU42NUhW0DDqku2fa
         d72kr4t/5XSlaikD+8+7GID0E4CjylAS4FOl8vJxevJUa1dzLJdEJjL6kea9OUCE/TN0
         4znab/F8bzpGuQ9lKafl/XlEx1OpQFIA8wcHyOSh7tNvX4e+WSGAyKwY269KLaw0EEA4
         EREitwyL3h6MTd6XpIWFhx/tyC8/IZ3GXf42VoX0uqDsrLd2121e1HyTjmBgscA+M7MR
         VPhg==
X-Forwarded-Encrypted: i=1; AJvYcCWOiZq/F0NFyOqElwUYdqHpioEwb0Ku90wXh2lj7szJZu5ES1klHbJADVauHGQHSu1HWzoggEZl3Bk+sC5sl+MT@lists.infradead.org
X-Gm-Message-State: AOJu0YwjWakVvZAm5vQzB4n859wpLA5JZlOu/R7vZDw0PxhK/6ZnXi3D
	viBGftH2B2LtfYxqVjCHE90paNOhTAadYZ+v2RmnYQisiOVxnSmKgCQf8AlQfXiug+BUw8z4Sjy
	Yq7Lmw3xPhz0Nj7q5+fmlj4fmVQnaqA==
X-Gm-Gg: ASbGncvPo84QZbApcnQgp+zKBo0jot3vhM5eexCCbivUfLyb4Z8NH91YS6+SRTwBDSt
	++ZvIDPMh9JAEqolKRmuy8D4/JBgB/Q3L
X-Google-Smtp-Source: AGHT+IHoeHq1SaOkzoegc7LOfrsp5NCsRkFD5zT231LvZh60oKXqnaI9hhCjtdWG9vlb54GAx+il0BMwPnlOQyc601A=
X-Received: by 2002:a05:6902:2684:b0:e38:b2f3:b7ab with SMTP id
 3f1490d57ef6-e38f8b346femr11037579276.24.1732533866931; Mon, 25 Nov 2024
 03:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com> <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
In-Reply-To: <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Mon, 25 Nov 2024 12:24:15 +0100
Message-ID: <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
To: neil.armstrong@linaro.org
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_032428_392130_076F72B0 
X-CRM114-Status: UNSURE (   8.41  )
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

On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> So this controller only supports a single mode ???????
>
Most likely. On all devices it is connected to a single built-in display.

Ack on all other changes, will be fixed for v2.

