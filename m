Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B94C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyKP6Putv3tmzHtUMFf82Ds+RcboqzTfe9uuwVS2J4Y=; b=Bwgcm4ij+uBhf62485v8QdMQHV
	VP8ifJgvJdNiGUDbraA4GnCvB3mV7hmos3V+ETQFAh32rJCeD+O/bMBoADSq0gJjdkNoSN6JeyyWJ
	GYYbkCuoGLslflpjx0aV201ghR2NT7SxYJ78LaZME/O3LS506+EvXKRaERVXI0O52kfay7fhA6UR2
	4Szlk3+O4xjPH/uP3eibEupceWhp63L5p8nag54zXAKBp6mswRRscSpkVTjQ6BjstylA33ZpCBiAm
	uHlcRhh+9I0lOiGUdF+oCb0jE+ywFN3qal8NUmf2p0UIQXJIZ5O3Qn9xd93VRA+RA/LZMWtl5M6l5
	4d5uNmtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumKK-000000029DO-2p2h;
	Fri, 14 Aug 2026 07:27:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumKK-000000029DC-0FB6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:27:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA47B43F59
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F95B1F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692459;
	bh=xyKP6Putv3tmzHtUMFf82Ds+RcboqzTfe9uuwVS2J4Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nV0Vr8rKixrc7XLCYkFLYbGQe3LzGpP9V8w8D5n4wn6nn1lr4bfCnM+4joUTHydvj
	 ctvAzKgI9/ffkRMPM07TcQN0AaxI/lGGlYYiriB9R/ozi4++PH1sAtiPJY/CTG3+eZ
	 52yiwq4n7R3qYDQ/NxYwOz4i37uZfqhwiHYmw0gfcCuvyPMHmCt0WWSPtRIB+oPfPt
	 FJqQfu572f6HdRS6rPw6QtNJG3MlDLHbDyBqr4L8GUrtKzyt48bL24gG7NSdkpSpeB
	 /A+GqY1ifun+84+MKOUq/4r+6sJ9bJl72y5NdPsjNDn/E5qyEAYT//fdtK2LoHNOi/
	 jngJ+PmHP5Lrg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aea0fff535so680340e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:27:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoxxofHJKrBtneX5GtAm/yF1kPl5O8ZnRYZxOs/pjV2PfJ805jJ71wcj1hUHzUvD+rau+d5Mazbs2hrs6mDjrjn@lists.infradead.org
X-Gm-Message-State: AOJu0YxeTs2V189AKPCf0LmICczNbXbRXnsnPFTYPV0vUnZRAkvr4mRD
	lxnfyzaVBng/BQtdvjOEPMXW1Mj4BGKKSXacE+vMlu9JDtVki6Ef4ul21S4jAtJ3+L6GjUQ/T7n
	pymHpIFBj7p7cykrVoUPblEDb0UwVnHo=
X-Received: by 2002:ac2:4f0c:0:b0:5b0:eda:de1b with SMTP id
 2adb3069b0e04-5b45915d0f8mr454029e87.16.1786692458453; Fri, 14 Aug 2026
 00:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260812015915.3477180-1-eleanor.lin@realtek.com>
In-Reply-To: <20260812015915.3477180-1-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 09:27:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLnoWYL6t7Kyi7nvgK_O1_vyhePdarEx_YyaWM15KmEP9g@mail.gmail.com>
X-Gm-Features: AcwNN1W4Ao2WeU4jPuP_3kUFjoCr1fSiFapw9L5LmScbnASe1Z3Dl4QdVCKKviI
Message-ID: <CAD++jLnoWYL6t7Kyi7nvgK_O1_vyhePdarEx_YyaWM15KmEP9g@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: realtek: rtd1625: minor fix and cleanup
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: tychang@realtek.com, linux-arm-kernel@lists.infradead.org, 
	james.tai@realtek.com, linux-realtek-soc@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, afaerber@suse.com, 
	stanley_chang@realtek.com, cy.huang@realtek.com
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

On Wed, Aug 12, 2026 at 3:59=E2=80=AFAM Yu-Chun Lin <eleanor.lin@realtek.co=
m> wrote:

> This patch series provides two minor updates for the Realtek RTD1625
> pinctrl driver.

Patches applied, thanks for your persistent work on this driver
Yu-Chun!

Yours,
Linus Walleij

