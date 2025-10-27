Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C87FCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRnjBnuhyqMXvpQh9LLMBSoQASKq7nZHyQViUHKVz1M=; b=XngRXsoVf9Cron01Rz7LXMwYWp
	KpJubd/8I/BPU4FElwtX4eWONxfp1MN9nIM4baoTVXWu6Tr6Jm0vMYGZsKLnKDClRP+l9lTsGryrl
	dRKZPSEQ7LtA8u4LKpyGvEvXsNMvGg2ViIxO0KkiuYPHlVFrXkhrA9WWqWZDYjZOtO5OvuJ7K7Cco
	Uze+zW/0KvR7JTgukv/jIDHWtYSlX2ODDVHiyP0l7Lj0t662C8aZ4PLwbeo7+Wi+XtKQO6Np5ic3I
	lszeALN6Pcu5Hxd+n6Ufz9Pk/1+DMx3oAQpMNAmo6SE1l6f5bp1pYCSVlYBULm/O/ndpsu7v/gkQv
	L9JLI7bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDM6H-0000000Drg6-0QPT;
	Mon, 27 Oct 2025 12:13:25 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDM6E-0000000DrfE-1ywE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:13:23 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-378cfd75fb0so48782261fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 05:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761567200; x=1762172000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRnjBnuhyqMXvpQh9LLMBSoQASKq7nZHyQViUHKVz1M=;
        b=UBTr00QGSZTf39968xZc6BQ7BAMzEb6HFf9D79vqhV1w3Oh+J9q9amE3gaY7H8mBqJ
         psAHQr6CWUBsm7UYGtI/lYTxspBLBDyXokEc34UjLw6bWj9vV+DYfhYINxJu54RXGA6a
         96pcC2c+ZB3CM31xwDNxXKVoNwxl5zRg+rtyRKQGOUuz7MllUV5JKnHgJGXSxsVvouDU
         QLirgZhcFjHuaB4u0wJ8inLkY+K2ahBZFSO/CAnLTp23XZGpW5aXEQPVO1FZY8HVUt62
         cXCHcRh4dx11lt8UtAxpBMMEWr7cns9R3sGkcsL52vgOzC8fAmbEilrrAOFmoNKbuNVK
         jrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761567200; x=1762172000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRnjBnuhyqMXvpQh9LLMBSoQASKq7nZHyQViUHKVz1M=;
        b=KHmBhjeGRT5dd5GvNOH3EO+a4xHg44U/SE8Ea5948tYqFij0Yk4wGuDiPi/7lblOdd
         kk8wVycZrwCtTUZeCmSWDhve1JZ8uvSflO3cQ5TSAktKLKz/ysNT8dHoKQ0fJ74f49gP
         gSbe5uP7o7uPstGPreES9jYRL2X/0n9eG0oQK8VyxYIgqN8AQHvZYhiDKiJZkNe9co7b
         xhkXmWBCgvMBO/Sck635cIefvvcNODtxA9EFED2npDZ6UYuBPHRK9XK6yVGhbsTY/MZB
         wyzpqwOZjEJv7/TJhRALY0+EBWm1/unX3Su9uKhTlwUs6r9qxcxE40lE5fUQLXw9eR/x
         eEGA==
X-Forwarded-Encrypted: i=1; AJvYcCXy9Hg/IlxDafdMrJOMvXABkhh7zwGrPKSzdn0DIEhkaOIlXzq4ueNNcOHSmvLsWpycacGspjX4c1FfNr3kab+c@lists.infradead.org
X-Gm-Message-State: AOJu0YzBhhM0gNg2XFqOoyiITzaYHtlawPdzesBihfiTqiA15L0rXeEA
	/++eZPWqU82FeqtfLorv1RBHyfxpjGYzw9KogXV+CwH3o4/20cDJtm9zh3o6JDMAjKYgq/Q5FvE
	IPTsMOyzC2T/ZfPGXB3AwgCYWQ37XiXo=
X-Gm-Gg: ASbGnct3G0aTHrjmyvgsY94OITufxii09PeRQmPIOck4IblSnUyOakkvkzGT2960eEi
	kQze83J1lpKrefp3glTkmtzlbvW28i/ANNvHu5DC5K34pfU6ctwtTp95MJinqZ1uj0JnG3hcCDO
	+1SSSl6HaJuKz3pa/qyzH3f4dI6ON92JIXoud+dFxGyhXmyNup+iCWbJFLGJJSYmc5Y4Xss+VBV
	843NmLmkNWSmpscHEQr9BgLlA4dwjcgrK4nSwtrbLrqTLSR+fgGvCGK8B749Sv5/MkMqktL349z
	UfrsrkRCuvSg1iGKFekRXsPD3P0=
X-Google-Smtp-Source: AGHT+IFFfKN+siPeEk510LCYlRaBchkOKpAuwWhbm3bWGz56uyRA9KKdEl3XVRQWOc57AU14oMs/9BA7nmAnn1K3lvg=
X-Received: by 2002:a2e:be09:0:b0:372:8c4b:8065 with SMTP id
 38308e7fff4ca-37797a2cb95mr104193231fa.26.1761567199979; Mon, 27 Oct 2025
 05:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251027110406.543370-1-carlos.song@nxp.com>
In-Reply-To: <20251027110406.543370-1-carlos.song@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 27 Oct 2025 09:13:08 -0300
X-Gm-Features: AWmQ_bkk_6yx_Hjl3n22lrPiupz3ujJbjohrrhluMrC5cpjjXVzvvJEhkBoNxhs
Message-ID: <CAOMZO5DM5NyGdyz4_6WF7qcsMmjAdQvfK0AKxZprUfhC=882pg@mail.gmail.com>
Subject: Re: [PATCH v2] spi: imx: keep dma request disabled before dma
 transfer setup
To: carlos.song@nxp.com
Cc: frank.li@nxp.com, broonie@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, linux-spi@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_051322_516162_39AED53F 
X-CRM114-Status: GOOD (  11.92  )
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

On Mon, Oct 27, 2025 at 8:04=E2=80=AFAM <carlos.song@nxp.com> wrote:
>
> From: Robin Gong <yibin.gong@nxp.com>
>
> Due to a hardware limitation on SDMA event enable (ENBLn), the DMA reques=
t
> must remain disabled until the DMA transfer setup is complete.
>
> Refer SDMA 2.6.28 Channel Enable RAM (SDMAARMx_CHNENBLn) section:
>
> "
> It is thus essential for the Arm platform to program them before any DMA
> request is triggered to the SDMA, otherwise an unpredictable combination
> of channels may be started.
> "
>
> SDMA hardware configuration is postponed to transfer phase, so enabling
> the DMA request too early may cause unpredictable channel activation.
> Then keep dma request disabled before dma transfer setup.
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Robin Gong <yibin.gong@nxp.com>

Should this contain a Fixes tag?

