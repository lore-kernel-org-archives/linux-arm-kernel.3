Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EA4D25043
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 07:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cxgNENcfo8cXQBg0dw/jO2senp7A8YTAU0sZZxB0f4=; b=M8jQ7X0xbKMQNBoaZTmZcxhoKg
	+aFtYeFz3Ad4TvzhqrcewmJ1d6qzCGnatKjLaN/Ld3/ru6eRlopwq/rXQgTWmsna3GHeFeGQmF9/Q
	ANFuR+SnYY3jbheMhQLqZJIZR9t6LrR4ljSjtnAm2xOgMsLulxstnfzmaNZPat59we9sjzuSTY2l+
	GEJmSaPOOyTJ4ShT7rFb5j5dYt8B7j0DXbtAXec/x8eFWFx0+b33tnOc5egmlbCYsTcIe29179yKH
	Mft7azJJC4hn8vjW0BeLRJk7wXofzzVMOmnjrJ4rRqZkTGiASCJhx7S7jP2A5UGsB5higGBz/KAJQ
	E38BVx9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCbd-00000004v9u-0KcX;
	Mon, 12 Jan 2026 07:44:53 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCba-00000004v98-3WHl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 07:44:51 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59b6df3d6b4so5992903e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 23:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768203889; x=1768808689; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cxgNENcfo8cXQBg0dw/jO2senp7A8YTAU0sZZxB0f4=;
        b=IEbRQFLf2Nv/INReHoLlGQXfWIvTrB+uZqPExx8wwGTVE+GgODP0xnLbIBRumIbIDL
         sEUKuX7eoe5VyIoxkYUWplH3dsIg30VZJ1m1v9YLf0kFe3ddKI8IJtFBp4gGG9ixxMng
         xu/6qrtDRIbPbio85gevGkSd+lAgeyMe5IgFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203889; x=1768808689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4cxgNENcfo8cXQBg0dw/jO2senp7A8YTAU0sZZxB0f4=;
        b=mhktYEyRNt0ZgpmxtFsGGpVr/OsPktt5u0NUcVLAhsmcPWbC8CHGf3IT8OxRfAXPzb
         jTY58Ou4EEeLSrHO+gA7LmQPYb1O8RT4lihaPuHdJK33NPsbp/e800Ihrwmhw9AROptV
         7HeizM7v1mtD/+9x1Vjd42WG+V9/posEhc31NWQjMiXIPFPXf9X+sDZ4nvw85kR9Cfxb
         3CHAEAhIVWWrJ9H2OSVQKLjaFB5tZfIOeNZjnGICftQjdJqiGPyfQHipcFFrTLxS6qmS
         CtV14QD6Hyw2EhdWzNWEXB1g8BqmpFhHoKq29HICg7cd0P0qCHsK2Zu9GlhTQmgULwR5
         gZjg==
X-Forwarded-Encrypted: i=1; AJvYcCVlZPTShX9ri/1wu7MVB8NrHx5yISfCEvlfRKpKToZmh2lOOOk5ZMv/1H9L8XuqFqCDrG7p2wh43J/sJeOBT+PK@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs/SldNHm9VS4k1P99R51SYUENf3YiFs+gR0eKQVEf6DlygBgF
	EBJSOu1yksnMsk0lsKCYRZ/vfChLgBSQ7KJzVrK2JJgJyRVv4XXGNjrw3otY95ACYUbocyIz4jN
	vJu4pNbk5wV+5Y0Xqlg5mutUOb8AJdelS9s5SDiY8
X-Gm-Gg: AY/fxX6jiZtxopd4+z0wnqyX/lKWJOfTqInZCeqYM5W0cwI2Xe5udNw9rgco77PLjFp
	d2OfDsv6mvUz5rDpNmTnuhoIUkWUqvaGmA6JDYDlaXZXmOp5yY6RAwMJB09iNcBkgyPn0XYqb+j
	GKd5MeBa1QZOZ8KBr5MCAW1jsdFRo1Uu+151DC2n+vuX8bHI9VSM0B926YrrnopsZuQm4vY0Wp3
	FYsYIcVbpOig+fWJ4hEpOXATJw3T3u64NErVNVKMx0vvJZz4emrnJFFSnQBnw0/aDDCiqw3+HJS
	5DAq1C49F32TEzYxbImBG78+
X-Google-Smtp-Source: AGHT+IHw7rJNOI5FOhbZX1z1+loaYEI568M1UN5tIdw0I/h/UzWdRmrgGYuJ1o+tqHTlBgV9Gn7UvOzvsEm5UoDFFCM=
X-Received: by 2002:ac2:4e0c:0:b0:59b:7a80:3b66 with SMTP id
 2adb3069b0e04-59b7a803d15mr3432200e87.35.1768203888672; Sun, 11 Jan 2026
 23:44:48 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-12-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-12-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:44:36 +0800
X-Gm-Features: AZwV_QhvNS01wOFUK2LxZMHidH88HiYPvQjeQAgpHhkp5P1dAOfPIn4Zb_mnq48
Message-ID: <CAGXv+5GywzbWWMEeAkexntNbRfUzdnahZ8oT72ZMdzLS6JDiUA@mail.gmail.com>
Subject: Re: [PATCH 11/11] arm64: dts: mediatek: mt6795-xperia-m5: Add UHS
 pins for MMC1 and 2
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_234450_882546_6DC4A8CA 
X-CRM114-Status: GOOD (  10.90  )
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add the UHS state pins for the MMC1 and MMC2 controllers and,
> while at it, also add the correct drive strength parameters
> for the default pin states for those two.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Format looks correct, though I don't know anything about the drive strength=
.

Side note, having a pull down on the clk pin seems a bit weird.

