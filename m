Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B74DC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 09:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MzFqTYg/ttLX5uoaIbZhu+X3rO/zERjBLQIlgSQny4=; b=PuqweDpBJstJymZYyMvxobM+r6
	agR6OawgWUHBTiG/lo2CV9Mk5k0BheJOan7iNXlb1LCqZ+Tifd/QfZq5z3YKzsLAefZwPFIgC/4dW
	6LA41zKqb4awsILt8tW8S2P4xtCYFsjrC2gabPsFG0ebNrG4I4FVP7gHbwfrYfH1bE1YOhCO0b+2q
	VJwIbMwL4Y2vlh2liSz5/K9xT735yoK1KY9PjdPpdfmVgkjFWpmHrC2JlmrDZoIJqrAri5c6a/W64
	jkWw4VNQ8hHS5KcjHk0ci3UjkHISysLn0qlB4qCb4p6ZJIQqRkOfeS+VcbGJNAvrX+wa+LwSlsJgo
	OCUIGqbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCzR-00000000HsJ-2GiN;
	Sun, 09 Mar 2025 09:30:33 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCwC-00000000Har-0GFq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 09:27:13 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e63961ec440so94490276.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 01:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741512431; x=1742117231; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8MzFqTYg/ttLX5uoaIbZhu+X3rO/zERjBLQIlgSQny4=;
        b=dOxa4arFWnUgO1W63EWsD3XJi7Hp09q8UEmKFVVAcgzkqP2VcmVumuXowPsGZ/ewzj
         8JR+SBGefY6r3oVw1ASQKCB9Q7Dj50WcHs/TaN8l8Obm+dDrb2eL5R09AY/iTTJCghXV
         r0ckT0FjOfhJmG69fyeEF9tfKFL8I196GqMjB9gjP7PJNRgUt9q028oLRXpJGGYeh9Iv
         w0pn7+trws+5F1zjbbOoas9SCl40yaxtjTIBCZMaE6l3A+8eicM7Gt+Cq84Pcc9uv0+C
         Kx4W2cVMoJfhiMvs0MtXfY+1aLOIGZFTo2C67kmWTo39JINWGm/8VQ18UhaoaU5a75fA
         xWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741512431; x=1742117231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MzFqTYg/ttLX5uoaIbZhu+X3rO/zERjBLQIlgSQny4=;
        b=teCVij8pTh1dfrzfGoLiDgl6+e3aCdWv1veookEEPtd3PHKreOlbz6SC/sOOy2UfmY
         Ljf+C8ut3klNw63P3qZOlaWwTiPF81u7XOQ11i7AqJhQ9qGC/Oopx+YzFO1rlEzwuU+g
         qsp/hbxjU0zO6luNl/Q96VP/GQII8Z0oRoc0zZwiazgLaVaFLBXNG+473NW76WCkJlIo
         FFFEr+s4avx/KvZmqI8Z5ydGBRdCAjVRXnrB+uc8rHXLudDWWVIExOZzMcbq6L06CCmj
         sfhPiGQxGJd0+eeKDAjbExfKVhs/qQfKrARYKj3DhbqJLoyvW6BKuiserDRTKddyTc+n
         K7Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXVZZ4QTwZhSmlbarOC5CLJ8lISD/2NTP4D5xNoagRqHDKOUrTqMv8rOC1ekxjzTKMKDGD6bm6+J4hAZze6Sek5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7sBYWJJqhugCuAKB6wPSWg7PbpqdMNnWQvmfgzewJx374pbYY
	+iJW2TkzFqXP4jQMIkzKi4cwqXa3yWEEbzdm+A7j9vvjXywPVweS50j8Jt6gAkEBfVZX4zP0PGO
	UoTkQg/EGRaKxF5B+oMNx6kkgiTrbDDw0DXOsrw==
X-Gm-Gg: ASbGnctArEHN9mcOSKBnWNJNxh1p8QEoB8/nDJo7jws1XphujggYba/5crM3LyxYJhE
	yR81UU3Sa/la2vVtH4fSfcvOzsDjKBsFla8MOkzISu+CZOwWxZxOJGoNJo0+WolSxpooqfNQCrr
	Y1mlcXE2zG+h+ClWxiKBk9EnnF38WWqi7unQiExuR7
X-Google-Smtp-Source: AGHT+IFA76leXty/jcWXJzC9DDrnbvcXI51BQa5AVFEVNQnlG4hIa3hv03b3Pkk5R9S7knKinfGf9iLV/UMM6mz9Jyk=
X-Received: by 2002:a05:6902:110b:b0:e63:326a:3acb with SMTP id
 3f1490d57ef6-e635c1e4bdbmr10097346276.40.1741512431172; Sun, 09 Mar 2025
 01:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com> <20250308-phy-sam-hdptx-bpc-v5-9-35087287f9d1@collabora.com>
In-Reply-To: <20250308-phy-sam-hdptx-bpc-v5-9-35087287f9d1@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 9 Mar 2025 11:27:00 +0200
X-Gm-Features: AQ5f1Jr0o-mNk31NaHNXGWXnai6sEVvAhCvxPdtXNqLeXppZC3-JsMDZY-z7vX4
Message-ID: <CAA8EJpoCMp1Hk7K=OTgR8BW=tncRFTYBKndw9UG-rS3JYyO3gg@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] phy: rockchip: samsung-hdptx: Provide config
 params validation support
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Sandor Yu <Sandor.yu@nxp.com>, Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_012712_099766_349373B8 
X-CRM114-Status: UNSURE (   9.06  )
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

On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Implement the phy_ops.validate() callback to allow checking the PHY
> configuration parameters without actually applying them.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

