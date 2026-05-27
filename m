Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0445FCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kBtW3eK/5g2kLvivBtuqbvM+kYyF2/OS9Ez33b5HOA=; b=Ry358i1iBrQNGa88EPW4Z4lxgz
	4Qck0WKfYAfKJiW2CkEyhNKvJwYDVbo6kUhkCgevLyK1/m233xTizb4N7GMHcg6P1eL5mf6tjKYy5
	2Aq276HpS5YhTpWdXEG3/TMVtKsy1du0CS8m+9gImpOgsikSpYsjD6HTsSTVoI12a+zEqpW//YeDh
	hPIzbxa59f4Ju/ZKTx6JB4I+aLYQiunlXK0qvt7Coxxb/U2FpN8iDCiX7k2kL18ycXiZp0110Vsic
	XEnkN7degsnrSCdBJiwh/PmGLPJyWEJMdRrQNyzWdbAfLe86FQh0A3Z5JcUVH2XfSeB9+zJLtZb8O
	hbEypQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSE6q-00000004AUr-0zhq;
	Wed, 27 May 2026 13:15:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSE6o-00000004AUN-3Kgn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 13:15:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 122C7601E0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 13:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF2D1F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 13:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887741;
	bh=0kBtW3eK/5g2kLvivBtuqbvM+kYyF2/OS9Ez33b5HOA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XRGPurKdDfdIWGQ0RUPsNJ8xhRjyGxAJlYknp6FP2tLICM9P0a9msA6OKbk2YLmZB
	 8btINQ4C3mkJh+QoBQ28wHCscfV8PNb40oacXdjunIV2YKHIbZz/RyPG9WOIT4VFSO
	 BzPR7iWR7+AbAoupdfltmPZDhZFPnZciiNOvYH9X20o26otyMNzGO604CWfZy+RG3x
	 bjzDWZH2zqcHnQVKP1zY37PA8rxSGmJtfV38QXEnGqcPZ7g1YzAg+Y34fthMtTEBMl
	 eTgIBkR8lrH/D4zlOlg0cj9Htqt/P0pwj/+VZcQhWBL5Z5WWG2tSDJJIWmtb8LiXEE
	 N6RItRXQ+G3/g==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa2c25c632so6724311e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 06:15:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+cUOOsWllvAeEw1R4QmEQU0fSwPkTR3O54p+/i33YsqOv/xGbk+fDl6x+liRzjAIKTWTmzvVWvQuQziexwH3rC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx58DmiyZa0SEqBllsQ3r0yPxkMvusDjlpGGphWc3EOXnBKwO7r
	dBTfwzfgOQn0qx2HtesANVLT0hnQC+hNNS0nMnruNyzlST7NLrD+KLmUy79GOynbjlpYRZGqu3v
	KeBVDz5Lf3Q1w6iou63nwJZJpaCEhH4I=
X-Received: by 2002:ac2:4839:0:b0:5a4:1add:c56e with SMTP id
 2adb3069b0e04-5aa32328fd2mr4719434e87.11.1779887740531; Wed, 27 May 2026
 06:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260511183002.228520-1-kmayur809@gmail.com>
In-Reply-To: <20260511183002.228520-1-kmayur809@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 15:15:28 +0200
X-Gmail-Original-Message-ID: <CAD++jL=OfkGMJMsevYRex_85pm=-xMN5-DjbbCgXAXtkfpPjZQ@mail.gmail.com>
X-Gm-Features: AVHnY4JrPo3eLZQHa8Kr4qpK50Dnd5cujP8cExxfw-lR9epeKnnn0hWheRnamH8
Message-ID: <CAD++jL=OfkGMJMsevYRex_85pm=-xMN5-DjbbCgXAXtkfpPjZQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: actions: fix SPDX comment style in header
To: Mayur Kumar <kmayur809@gmail.com>
Cc: afaerber@suse.de, mani@kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

On Mon, May 11, 2026 at 8:30=E2=80=AFPM Mayur Kumar <kmayur809@gmail.com> w=
rote:

> Header files should use the C-style '/*' block comment for SPDX
> license identifiers. Correct the style in pinctrl-owl.h
> to satisfy checkpatch requirements.
>
> Signed-off-by: Mayur Kumar <kmayur809@gmail.com>

Patch applied!

Yours,
Linus Walleij

