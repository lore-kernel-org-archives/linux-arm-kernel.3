Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA41E7849A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 23:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMksNBI4okirn91dF+40cWo6VsIqz/Y3+k9t7y0NYw0=; b=Ui0jMnjecfwcGBPRrM3uFN6DuG
	zPzb237NGD2Kd4QzVJQPKEVhlNtaIhcRPASt4bWZyDdG892jRQF3dIbfSsIhIGk4HJ04N+bCLTdfh
	irIIKt8wgPsVuu9ulfmr7pOfnJ2Km3h62SyksSHqtownzoLdsYE+CRwx/fm3dZNR37Sk3Y0iimFPi
	2Hhy+bIB6OA53eICPRHzTlbxwDVpmieG6c6FHzf/DFct3H0awyrQdwVwvIhBX7cipYtO4xbEGv/8n
	0FBeilGLYbynlAVEsqXe+EvmoWbBJe4TFEuHbcG4+cONUZwD8pcFcXZSD40lhYiQcMRdLLM0fsBug
	l5+k4zmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYY5H-0000000HUHc-1Z1M;
	Wed, 24 Dec 2025 23:15:59 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYY5E-0000000HUGq-3cGM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 23:15:58 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a0834769f0so63687085ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 15:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766618156; x=1767222956; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMksNBI4okirn91dF+40cWo6VsIqz/Y3+k9t7y0NYw0=;
        b=jn3SrlAIUkMWC+ARIi+rw1LJljdGqv9D2Z9Nw471d1/PHlrHnej6c6cWXyfNCRkbuR
         /My3kt65rZiYXeXVzntxrZrAeJHhEZkU8YCSbF1tfYBCI2/WGDdWQXIY26aPEQwG8eXx
         CxssXQwpVzKf5fUlKfaDoNEG1+jGSoaeASPuYkbL9SiOxt3iJKpanoFKv4JkJv9lYRX6
         auZNnxmwHcg8tN+2upiGsvjwjvuv99ZRNiw4nLzTrTiNKWcIET6QU2cEliF4hWAoZqTp
         giL2rx0/V0q1b5HAKm/BVg8IVRnNusVuKmy2+b7H55QuSy1XheZ5/SMSw03Hi9kRJJTh
         VzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766618156; x=1767222956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kMksNBI4okirn91dF+40cWo6VsIqz/Y3+k9t7y0NYw0=;
        b=RnFkQAt1gMEBHkCTLf+bbLl5oJSo3AEEQCJ7La42SXBPwV2RhecP5sD4CRlX8i9lUE
         7a+6CiX3R6cY91dDI8XAO6WJioDN48E/gHFBidDjgoNIkc+/m+/OrWyAucB/VRBw64u2
         jd2xPvkf8rs35YA+57+E6e3FiDnUAsVJ9gzHTng+QnLkTQ/1OeXbOwuXiJTHVfJZ59Qz
         zOuuZs/FJ1eipqC+ujRq8unTBqY7813yl5c96vH0WFld/gk8Fl0pcz7CG0YFEpOIHumA
         PKbNecxh9H4XUAckptx+gY3cjlHfaPZ45CGcP2lihVl3P2jt9mu011pz/gQxA1r+Oy1N
         B7iw==
X-Forwarded-Encrypted: i=1; AJvYcCVi4GsqYN053467pbe0PuN5U4sOhszBXbJ6R78Gfdpu492tjunOWPUX4fFPhLpS6MdyfuJOttrNXz9JnHOL6UBQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxKt99dfoasw6qvMgQUqLXXR5M/9lNa6Nj99UP6Xv5yP3BNKl5T
	IF5gvg1ren9hBtGv2uvDMn+lEg25LshEMdX15pvjtA/QB01D4w9bgzS0FlaWrNjaIYk1yVH50/1
	Yh9tBvqS/sk886mqTKRBKPEfVk/WwQmo=
X-Gm-Gg: AY/fxX7QiiDA9+6T9kx14GCO42VtwY2snZKbMpcmznu4EZGDJGjVckZrDwOIFYGYw+E
	upzRcLEJlMeYIqcmPtqWjN3JWFlqtmr2xrYGsv/Ewvd76Irx1oGVo9Yyie4IAB3H0PKmR5IfZy0
	WmhTVBrEVtaZ7+VFT5G+x76wBzupmEVaHkcKs7RtZzdceD1h8VxCcoWzYHj+gYkL1MAXJDqV3wW
	yZ3WvHRuRSzNmvGbDd7Th/NPE3zvdKLTMlUoG0evsVBACtRt3DJdcC74aLEXoH12k77yelC3qf8
	5DjD8iqzP73WevDavJY/6O0nLgZV
X-Google-Smtp-Source: AGHT+IGimQCF7uDiWcIkQf5ZGHJsugq8yU99cywmoPn2usoL23Cf1mdn7HpaxV2mzn+gUNIWI2A4OkqUcmfvAbx8uk4=
X-Received: by 2002:a17:903:2308:b0:295:5668:2f27 with SMTP id
 d9443c01a7336-2a2f2205789mr144409705ad.9.1766618155975; Wed, 24 Dec 2025
 15:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20251223-reset-s6-s7-s7d-v2-0-958f341449f1@amlogic.com> <20251223-reset-s6-s7-s7d-v2-3-958f341449f1@amlogic.com>
In-Reply-To: <20251223-reset-s6-s7-s7d-v2-3-958f341449f1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 25 Dec 2025 00:15:45 +0100
X-Gm-Features: AQt7F2r2xC2wIc6GvAUS4OY-EHPUACvAJXV_sv-Et3PrOio9vmU4SqQg3y8gAnc
Message-ID: <CAFBinCBQbpsqujgU2_xqy-=ZmPww8AbXq7Gy9ih23TmOzZNTOQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: amlogic: Add S7 Reset Controller
To: xianwei.zhao@amlogic.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_151556_924479_A2326E2F 
X-CRM114-Status: UNSURE (   7.68  )
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

On Tue, Dec 23, 2025 at 6:37=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Add the device node and related header file for Amlogic
> S7 reset controller.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

