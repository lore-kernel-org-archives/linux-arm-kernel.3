Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A839D65520
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 16:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81kUDK2FfLp/WGQa7o8TpKjDjzqNKseVMcIR/5Kc37Q=; b=xoij5ojUSeRbrXIg+GykTEOT0X
	WYmZwif0A5E5OGxnrccFv3bZ3O0sS9SQ0i5BPxB+7YRovvIzWKGes3yq9pb8b7JMZnkt6YGVjDXYe
	hwuNfnAR0zyw8HJ18ji8csJGqogLOeiAhB9A9fAtm9WshLLokDBW8PN5+7xIaUMyPs+R1hFTxnsFB
	8s963NwOdDkUa7TLxo3sKkslTdiUzNkw1Vbfr+NC4sO1E6rG3uWAFeB7KzDrev62RCGS6KGButepB
	3ZRdpq6p5A+9CeEbqBJIZQ7vApSmnQgxgq96qccQwv0YXUEVYld/UrqCNFZiGFws277tGUhBwSipb
	TCRXEfyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFyX4-0000000BB41-2BVZ;
	Tue, 26 Nov 2024 16:35:22 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFyW6-0000000BAkp-2aAu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 16:34:23 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e3882273bdfso6138670276.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 08:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732638861; x=1733243661; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=81kUDK2FfLp/WGQa7o8TpKjDjzqNKseVMcIR/5Kc37Q=;
        b=RCoRH1juLvZh/tJMHVuQ9myXETViTKo+h0xAN4gimG7tpTKrjfRH1uFzK39MbcpWFR
         xf1GXTcLWM5ZJ/HAoDWrn1CsU9r1nzzAcPV4fT+EWH2BZDZlIGzvfDgCQUTQZ7+jwvLu
         o5Nq4chJbreWaJsx9ouyFTKA/NLaNigq/zEZ2znRRgxe9EYcqfOdk/uknL2+qloA8xfM
         pdkdSf1RbRr+A41y69BsMkTIFe9cKybhxG733rnlPEnBI7VJ/0elTJFO01klSa75Fb6C
         d3NLW0hczT60GmY6TEv3B9eysrLwxeN4SSj9ded2D37FvspKNmnRzwD5pWP3SZAJ+pZP
         nERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638861; x=1733243661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81kUDK2FfLp/WGQa7o8TpKjDjzqNKseVMcIR/5Kc37Q=;
        b=gRnZZU4pItPvvWRCESv3SMwVHPLo7RQhpD3dBNipEjtJhlYL+FPe+E2/+3w5TVVVHP
         DGAN17Xy9yZybhP7LWp2LTUOCLXLg1US02LBO66u8cVxWGMq7MqAd6aX41DgIm1NuaiU
         SmutYcHK1NYoMq5g+tCm9fQ40F0TiPzHrfRSLOOP64mpj5bQI7GUFfPoeUviMpXlNoiK
         LTt4NPfWkSJFC+a7NEV4znbKhNSUFGReMqe4VgG0IJ/5mSjmCRcPB2SXgp/nVcB94TDO
         0QFeaNNUiukcv6jISC46/NglU40elx6IDcVRYvkF4IiP8IoaVBZVl7AM12Dejz6u6RC/
         hzFA==
X-Forwarded-Encrypted: i=1; AJvYcCX5WZPnuQO0f60Nn1XDQHJnBaw/vJksZNSFOZ+aZX81EX1C+pi5+qmqef+Uygsy/BsLTQuhG32iE1+1mg1Yr6m4@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ7dJgBLXZI6bo3G+sHpcIfXgY+00Q2fo029ovE5ydHlrLMXyf
	5LFrcKXFVnAg22tsU2BmjJllaEgoguSjhlK52psDp+jmu6VlZnmshV22zCzPul3neY/0/XyZCWN
	gVTOu7bvXAvYRojg7A0TsmW1m4es=
X-Gm-Gg: ASbGnctWxGrReqKQo0XzvLPmiBrAvBC3p6/APrs9dDKGZQkjvR2atnzTHvvpllgPaJh
	nHbSlWfWhvaDFw5iz71MZ3LpBnZJaK/uT
X-Google-Smtp-Source: AGHT+IH0rBw+xuH2VbnRPCa0ythGe+vmqwLZcKnDRV9jeUgWhfvMABxWAASqLF5EJD3NVkEYkOzdFIsrWd4Mu4/XXZw=
X-Received: by 2002:a05:6902:703:b0:e2b:d4c8:c5e9 with SMTP id
 3f1490d57ef6-e38f8ad708dmr15164230276.11.1732638860727; Tue, 26 Nov 2024
 08:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com> <20241124-adpdrm-v1-3-3191d8e6e49a@gmail.com>
 <f2181c71-db23-4d94-9afb-cb8f2fc46bea@kernel.org> <3a6fb7fd-eb3d-428b-a37c-f04d81e7fbd0@gmail.com>
 <e647e8c7-6df9-44f5-abcc-34db74b8e266@kernel.org>
In-Reply-To: <e647e8c7-6df9-44f5-abcc-34db74b8e266@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Tue, 26 Nov 2024 17:34:09 +0100
Message-ID: <CAMT+MTSetzODw-cbteQOgEYmEgpiFBVP5eDgjvyHGqofCU=VXg@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpu: drm: adp: Add a backlight driver for the Summit LCD
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_083422_650699_DACA8941 
X-CRM114-Status: UNSURE (   8.99  )
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

On Mon, 25 Nov 2024 at 16:07, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> BTW, max-brightness is a property of backlight, not panel, I think.
This is an oled panel, so no separate backlight device, the mipi commands
just change the pixel brightness. There is prior art in other bindings on having
the max-brightness property attached to the panel itself.

