Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D18AFA3725
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 04:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5TyLxDxTl+f2mZ1axYzsQh2njdkr6wcLvTK/Jvsf3M=; b=w9WAshLcSfIYiI1ZBbNMem1h4G
	dVFlCx5+E4+f3CULxUThJQvn8r3a62fB5wAdUxJoJSVO+N5QWfZi9Fkf/ky3jonfYz0xxd7H8KmFB
	jlyfJQslJdrLAKfzKx0CbqG1alMhpOXWizaZHqZEZwvsoWSQ8LRmQpvIaARRWYov4SUAq6ofDFbip
	ba0yIKW9ksbtJAxmLD5fdubc6lTya75ezcraJTdoEJMFQPcETA5Y7qbjrb1Xc6SFi2zXsyjuJKWOq
	12ujcsBu2DHMYiAcJJDhCePvncyZ9Ui8APkyAjiR6nPXQQOv1gXpRGQAMuDaHVYL2pt2XFQAZY82B
	gSEc4VKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbspA-00000008x54-1TjG;
	Sat, 03 Jan 2026 04:01:08 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbsp5-00000008x4I-1x27
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 04:01:06 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-64d1ef53cf3so13078551a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 20:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767412861; x=1768017661; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O5TyLxDxTl+f2mZ1axYzsQh2njdkr6wcLvTK/Jvsf3M=;
        b=d3LbDIWXos0XU+PLt/cYHFp2zYxBZs2mFSVhOLi4LNT/bMHfjz7CizOuVufRl/gKcz
         P08wJGzsSovaZbAq1KNXBPXK45gEkdWZWoYI8IOJTJGnAQ6zH51dMdmw1Pc8Qsh7NRu5
         +jhKAgiEJ+ZXMDYOPMuI3tkQKhG8Yaj9/FfazhTqRlC3Y/kvT6VrGaGQO9P1Cp3kOhp8
         +udSQaI/BCLylZtcquj0EeD2N+72huf+7G2pXA7YYglGi7uOL1eq+RyUr+pcnT2UKPxP
         stNPTchwKse40EMrUx/d6eQyMp++c4RUiAg1Pu1PaeJXkq4rtNhvQi+Ebg8mR41RkL5U
         wAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767412861; x=1768017661;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5TyLxDxTl+f2mZ1axYzsQh2njdkr6wcLvTK/Jvsf3M=;
        b=muJAf7jk0i8LRQkhG23JKsd7z3qJ4RkKMi8srmpynnkTre8/8aILlgMjW0ISe0EhM2
         xAj+i7UciGsEHZyFAIk7BMyBif6EFkDfVhNJ+Li1l1impQAAaKWLqB2cbN/sZNgDl/Nh
         FxIzJ6DSJpOd918OSlTPuD+7c74xcOnYBjzay6FcQvwiq9QJ8RqJBNmDYjFjz8i+oJ4/
         6+FkMAnQa49CPYltmFZU8Q+yXMAQyZB4RZH5UZfoNx/wwkyWtAkFac36O4q/8kQNAyVK
         +NJCQmCPl9lO8nrQ6P8lvN2rXzdmJkfr3uIJcuSb092WaKFLjuRyY1LlG9msEHtl24nS
         jkkw==
X-Forwarded-Encrypted: i=1; AJvYcCXd7jCjNM+qR9aC1Jz1XIH3NnvZ00PXlANjKfd5McR++8qzYejbJp4RMdoe1ME+SyM+FctINmNiYSSEG1N3UlBH@lists.infradead.org
X-Gm-Message-State: AOJu0YxX/D3OJLksVlTU5LPmVpP21gp3RKbFgp2DK1O96etkfe+xJv+9
	DKcYyXa5Hf+Cf79BvVcN3ATpZctiT7rRpfWpMZGA8W8vU+EdppSWc0dLMCnfwl+Bm9Xo+yx3QQN
	WSgtyCSgIV8Uu0SuOuZu2X2FIfJeZmpw=
X-Gm-Gg: AY/fxX7J8sjZeX1AwoSOTFEsLdccHHq5JnbyxCCxJ0eiz9f5XWqorFE+IR1+izGK4KM
	XeMpfNKll77hy35/JjbsoWQ/1UHNO+tPpQGRN3odZGnOe9MmP9LFg1eK3BejTq3dKbSahbuBB/e
	vi2ge3XFCr0evHEK81Y4SJ432cJVDjhSevzdhOUQSGvR7WTLst8rUvvgtD5uJjv48OsA0b8ytgV
	qaOR1KBCVEvwNUjtCHt/404baC+K415jbt0GZidFWvw87zU+lET6lisHaZ+eqAk/SLV3aZY7JNV
	ow==
X-Google-Smtp-Source: AGHT+IFbqOg1v7R6x4ZKSLsBtcF4IavFaKTZJD22J8rhS7PY+gLCvqJNHPA4Xulg1zgPgOEwgSlZWRiPLIIb2GrK8bY=
X-Received: by 2002:a17:907:d8c:b0:b72:6143:60c2 with SMTP id
 a640c23a62f3a-b803722fd2dmr4546055166b.51.1767412861124; Fri, 02 Jan 2026
 20:01:01 -0800 (PST)
MIME-Version: 1.0
References: <20260102131819.123745-1-linux.amoon@gmail.com>
In-Reply-To: <20260102131819.123745-1-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 3 Jan 2026 09:30:44 +0530
X-Gm-Features: AQt7F2quBQViuflKz_7WiGupGUP2_HLsYQ3tNIlxCVaZuJpRuYGaxaR_J_lrz5U
Message-ID: <CANAwSgQ2TBnGAwaykRFDCphAZOk6gY1yVYOroUDYnRwP1kZACg@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: dw-rockchip: Add runtime PM support to Rockchip PCIe
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Hans Zhang <18255117159@163.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_200103_549996_F37F10D2 
X-CRM114-Status: UNSURE (   9.51  )
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

Hi All

On Fri, 2 Jan 2026 at 18:48, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Add runtime powwe manageement functionality into the Rockchip DesignWare
There is a small typo over here,
 s/runtime powwe manageement/runtime power management/
If you need it, I will send an updated version.
> PCIe controller driver. Calling devm_pm_runtime_enable() during device
> probing allows the controller to report its runtime PM status, enabling
> power management controls to be applied consistently across the entire
> connected PCIe hierarchy.
>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

