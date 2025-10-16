Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE23CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 13:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdflzJnMQthLv2cazH+0O/zsQRo0ZmLpj7kbUNZvQac=; b=SoC+eMNwcmcyx259Xv2KMgy9r5
	7p8aHISLjHRc850h+eKmt0Q1MtRN2wMzIZOwR24tXdGvFnTzsMNlCjIwwMBQ8TMImNuJNUQx7u3Ls
	pa/ww804h5tU+ZXOpDrwRDKV/e0Dp0d4APDQNEJPlvnspTw3GRvHkptWUfYv+oLlkEebsQ4V4YSMH
	nOfRTrX09VE/uBoRkXyld67ltUxMkK8mF9de9BfJLc5trVORcM5NvViN6PyeDAH4vdHEm5ce22oaU
	oE4EFronYtifBHGTxAufpBCX8xp0oKz13oD+T9s8J/ap+wXPK2V4Tl0dPh6e/unxSzYeuheQBOfuV
	0rVlflNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9O3a-00000004sVm-0Coe;
	Thu, 16 Oct 2025 13:30:14 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9O3X-00000004sUa-3OUK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 13:30:13 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-87c11268b97so13323596d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 06:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1760621409; x=1761226209; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdflzJnMQthLv2cazH+0O/zsQRo0ZmLpj7kbUNZvQac=;
        b=DJSr87uNzXquORB95daseiUVjDHO2j1TmNWH0bUOCSXgADbSgIV9BRiAdc5++j+cTB
         I62o8ohWiWZ5VPJdkwwhOShd07X6KNQcBFPuhUb87OZlsJlSOBHR4GVJjDwK2qhKA5c9
         y3DZk2aLKguV9X9R22dAzEZ0ioYEuLnk90YtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760621409; x=1761226209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdflzJnMQthLv2cazH+0O/zsQRo0ZmLpj7kbUNZvQac=;
        b=GFMQ1BpQ6fj3x69f8TXWiaUYokwJm34rGdXvmc1OkQc/n83IvtwdqtggYL7OaEbu+m
         kmL3wr966Infb+oXtPF2dqnPSCYLNXYFZ/aeDCEb0WBCoTd9XORxKU1wj6Qez5iYwyU/
         3w21AYIAbofsxsq6VmzY0HRpWWB7tLNhmQvhWlnhNFX+ptTQlqakiIpcZNSvJORshFJy
         fynDvsOXU356ulTVIOIg3rQ2Du/+gH8fVqQdbwY/97VZT5vN5BbLh0qjd/CiidpeM8An
         oTHLTUYj+SZ3aRi9o1gVpmLEry0kNkRQdVLfRIbeLvIDmB8HH7NJK7eSofp0gmDgaJyr
         OE1g==
X-Forwarded-Encrypted: i=1; AJvYcCVoCT36RnPgDC4IP4RvdSQP7Ju5w0dZMIuZz9vESSlfoboJZKcWckHpx9ORh1v4n41NYS8Ow1/sjc3Ti9W9C0uV@lists.infradead.org
X-Gm-Message-State: AOJu0YxHX3blo/29lUwTAlTd5/qcSRjZc7DljAWsKsn/+rY7A4INZy9g
	xHdwDzEZki/3FvQH0YTckoap67cXwxKOfgMOPoR6dfGbLthZBa1iAsxEM2LV4Wk+qD3366Tf7eR
	bsBjCAi3wRXni7M5Ybx10pz7TTDMVaPlnR1gpi8461A==
X-Gm-Gg: ASbGncuDaUjOlUmT8Vp+FzLxA7p3+WY+/xmjLUgQU7Lnyi3yJXykViDEsP3eL95cyou
	se28h1nA8rrMyXlXvpYlUDs/nOMP2sZPl+Z2dRtqt6QcXCOOSzLSTZmbfxYzacEjsDHnXi6TOSr
	RACB3mCw+QCogD9dyjIsW5BCGEO0RpBM7KZ7uF5foC/TokkhuXtm1nHfq0O01YaMLdAVYO6oLl0
	l3nRm+UWZkDhXc9MrBjG6GIr40McTSXMIyz5mEWzhdMNh2J+l66cGytqIgxZiUp0GAW8/yrkIue
	8GNDNlg5yMpRQdJ8HNAD/QPfc8fphgWMcgIbSRZM8IN0ZRoP+Lfrhej27w==
X-Google-Smtp-Source: AGHT+IGnXn2OWekqEukP5vHXZxC+ehCPf6mZptuvjHzZezwxi/p2zcouk9xm0TfVXXXAeAsJj++O7TUZcBkL3bdq60Q=
X-Received: by 2002:ac8:5aca:0:b0:4b5:f7d4:39fa with SMTP id
 d75a77b69052e-4e89d1fe4f5mr2032761cf.12.1760621408367; Thu, 16 Oct 2025
 06:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251013-xdma-max-reg-v5-1-83efeedce19d@amarulasolutions.com> <176061935845.510550.12282030175889296984.b4-ty@kernel.org>
In-Reply-To: <176061935845.510550.12282030175889296984.b4-ty@kernel.org>
From: Anthony Brandon <anthony@amarulasolutions.com>
Date: Thu, 16 Oct 2025 15:29:57 +0200
X-Gm-Features: AS18NWA-hxbDFlI3b9UTsQcDU75GuNgix6cv9Elfy_HBgLGvJSUA3uP6hd50TSM
Message-ID: <CAAD-K8bP=cC3Tn9tqqQ74UJSq5YHnkuKNU46kEEr4K4YApqKpw@mail.gmail.com>
Subject: Re: [PATCH v5] dmaengine: xilinx: xdma: Fix regmap max_register
To: Vinod Koul <vkoul@kernel.org>
Cc: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>, 
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Sonal Santan <sonal.santan@amd.com>, Max Zhen <max.zhen@amd.com>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_063011_855916_098DE9E8 
X-CRM114-Status: UNSURE (   7.38  )
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

On Thu, Oct 16, 2025 at 2:56=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote=
:
> Applied, thanks!
>
> [1/1] dmaengine: xilinx: xdma: Fix regmap max_register
>       commit: 81935b90b6fc9cd2dbef823a1fc0a92c00f0c6ea
>
> Best regards,
> --
> ~Vinod

Thanks, and thanks everyone for the reviews.

Regards,
Anthony

