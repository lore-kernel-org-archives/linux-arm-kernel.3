Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90098C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 10:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbQfZE+vLsay+m41W/xExMvsph46lPBJtYHfkRyAxdw=; b=VmlgRbHmphzmpOw7V2iG73+SkJ
	QS7P+QEahaf5pwFslKwQBa5KFg+KjDZkOXejyUgu9eqF1A+jL0rpQL8onxG4qL1TPPQeGgLvO77SP
	Lv3wjo1gqhrabCV/tYI9E0aYWWjtgXauTKuo5CuPGG9e2lqJppKa/KBEh02VEv6dINt4sdQ+6Jp5s
	/bke8T+gVAxUwIXJHZl6CSrNs2gganMd3ESNR6q2q9xwb8RJUuvgyZIRfYy8PmROnd/M3ISJmTP7v
	RSbVlAOVE9YaUVIyKASTw8GrnhTBP5fV+tRPPBstt3GMzgwzCrtO2ZzO7dIBU04UBZvWrwLFgER60
	7IzbE6wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkh3W-0000000C4cR-16pF;
	Wed, 19 Feb 2025 10:11:50 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgc6-0000000Bwf9-1vuJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 09:43:31 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so5166354276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 01:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739958209; x=1740563009; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JbQfZE+vLsay+m41W/xExMvsph46lPBJtYHfkRyAxdw=;
        b=U7suzdW+ed6uGPeA2q7TFlJVr5sWfWG1vjzzMhLXouZYRRbVR1kkSNb82P2b0Hr5y4
         deAb3AQa+MiLugQNiLGivF7P47Q50UjvppzWe5h6CK8p6tj9IrS0jq84/pMqtPel2EJ/
         RWfEXJgUsBets+k93/ciF2N172UYitsmRqTegmnyjR9KPn+NgVYdf4ML1pL780pKGUqY
         mwx3fGzJIMOGkk5WxhDB9gpJID/jW6jF6D2WEcEagNWPHDE2FWfjNLR8NrGH168KdAl5
         ltmfBcsPA6lZSQMfHZiKuK24NQOtGKHs3/PNH5ZvX9H1AlETu6hNbhBWOWMYjjJLJpvF
         HEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739958209; x=1740563009;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JbQfZE+vLsay+m41W/xExMvsph46lPBJtYHfkRyAxdw=;
        b=pPyixZbNoxp+FIbJl36F4Edl0xpKLrJhxkAaiQYQ9h9B5X5zMsABAG0Lj5PK6U5yKs
         T/VLEq1hiAhO0zeFCHqstkHGfWsp6GrhRjVhIzhG2TSaly58TH2q/39b5cJP7vjYylvt
         iuWuhvyjrWWS+3ZU+pcwLIp9w4NrcSMzhFy5A2WQGelSBBaf9mP+htDjr0gJH4wSJJf5
         Usr1j8E78oWenj5AvkGv9aiANs87eKUrUkoYgbTzxxs+0syUy41p0kWBPOk+/NtvnOPh
         kVAAAkuCMmRsH8Z2uN4TqM+Cd8yYsVDuudZydObKd/kovdCTxRsLgV2y138lC+4O6ZLb
         bGWw==
X-Forwarded-Encrypted: i=1; AJvYcCVmN0z2jtjvnsbJSQ3tpCVeqcgoS8rnlE2+IK9yCF/w8KcQWfFZD7GWUZTWUIIXz23d2xyJmtZ3LEH57ZvzS/PC@lists.infradead.org
X-Gm-Message-State: AOJu0YxlqHb3sXZTNghfaQ6SmbsDR+rEmNA6yMoyGCp+YPCeG5hbCKmn
	xY7rTQkVuhIUK19Q+thCyV1ZpozhAyI1jvoB4J1G41eDLvyd7AbaNPVRzDiR0E2QTTtNTc/cmdU
	4sYEaqVjf/rlpvPVHUuwawPfr4tY=
X-Gm-Gg: ASbGncsFV91xNRk9m5JptF/5xhB2wtl79vscfSHupfOj7EODRduoyv54WTsdIri8KP1
	hF+DNN+asa6mcSoQ2GDFsGXEDPaGiuVRFfogoGp2jB57ad+cijIK7lWHJqLiQWp6j6vdQ4rKclw
	==
X-Google-Smtp-Source: AGHT+IF4fhS5ToYgiyprNptli3rl/YWe/Sr8AbYoBe7Xa+PURKeBJb7TRkFTdB3HeJfB6d1BuGRjs+ziA08+lfNk/74=
X-Received: by 2002:a05:6902:1509:b0:e5b:1453:d2e4 with SMTP id
 3f1490d57ef6-e5e0a09dcb1mr2433065276.11.1739958208906; Wed, 19 Feb 2025
 01:43:28 -0800 (PST)
MIME-Version: 1.0
References: <20250219-isp-v1-0-6d3e89b67c31@gmail.com> <20250219-isp-v1-1-6d3e89b67c31@gmail.com>
 <400d64ed-670a-4297-b43b-cdf4e8599c7b@kernel.org>
In-Reply-To: <400d64ed-670a-4297-b43b-cdf4e8599c7b@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 19 Feb 2025 10:43:17 +0100
X-Gm-Features: AWEUYZngFT_TlGtzAp7eDIc5jUmixD2xinxUmQy_lSABzD_u61AwBZNq6Cj2sCI
Message-ID: <CAMT+MTSb2gdkfCZE3i+0ah8AgE_G8mH2MFTms=QgFwd-nbA8Ag@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: power: apple,pmgr-pwrstate: Add
 force-{disable,reset} properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_014330_494843_EF9EB154 
X-CRM114-Status: GOOD (  11.44  )
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

On Wed, 19 Feb 2025 at 10:34, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 19/02/2025 10:26, Sasha Finkelstein via B4 Relay wrote:
> > From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> >
> > Add properties to set disable/reset bits when powering down
> > certain domains
>
>
> Please explain why and what problem are you solving. This looks too
> close to SW policy or really arbitrary choice. Background would be useful.

The ISP block has some weird requirements where some of it's power domains
will not power down correctly without using the "force disable" or "force reset"
pmgr feature. Basically a hardware quirk.

