Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACC6C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 17:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTJbJuAYewCnYP85dvVNBBoh8mXQ2CM52g5B5kBZ2H4=; b=zIcVKLfab4zrUR3NzEZL+ItVXF
	+W1nLlKPef0ycisGG+O/BdJh8Rg2E0kuN3j/wTVbEW0kohLpCMxZh5ZHhqlp98iaWHQFh/C5ZIVES
	K9ciuaah7Mdkn25LZTXs8R0tJtsEu1duiUxVK/CM0dkV8kjmamcMUJA5zJuTV2efq3+KnLqV20qZ7
	11oOsC28MCdzw7k1s8inHHnla9orEZMn6hqbvv3h0JFcoQRoqZPWDiIoUhoQymJesi5B5QEA/SZnh
	PHaR5xTmgzIWizgk8MOanVG4Zju4Y8miRyRJ0lXW8ObUGbN3ZMtZ+RZnFyBwB3+6E2h1HqcwFlMUo
	PKlb2iGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubNEN-00000002znU-2hjs;
	Mon, 14 Jul 2025 17:44:47 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLvs-00000002ouR-0YKo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 16:21:37 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-555024588b1so5085121e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 09:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752510094; x=1753114894; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTJbJuAYewCnYP85dvVNBBoh8mXQ2CM52g5B5kBZ2H4=;
        b=dqwHtltSps7r9hgMf23PCGT7R7sQ9PGeIOTDiQ1/WcceRN5++sRqQ6kZ8CTQs5DLBL
         ogU15zgAKphCNnw2Jo536a3c3+yXqxZQxwGzvRbAU3NuGzkUAADkxLhxhRZCkjhwOQKd
         PzPlFSS7R7bwBEC/N6ZM8ruD9KPGo/AQ4oRKkoTu/Ft6ZBoEVn2ZY8KAAtP0wTtFgnq+
         cRxdrOQV65N8husLKiiYr/8aA9cYTFlBhVGy2Pz/qWnlyy/KJpuBGvbhTdO5HZPVjInW
         R7r6uyd8tVu+A9Duv4y2qKrh7eXRZmKwWMDsLtRhwKA50oMnZCA6a4RLknWg6aabyEjT
         SvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510094; x=1753114894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTJbJuAYewCnYP85dvVNBBoh8mXQ2CM52g5B5kBZ2H4=;
        b=qcsTz8fPpSR4w0Yndl3aNCR78Led1rUWs5RTPWEl/PZuYrXFfQPGAEgF3kWzmwbSQz
         nGKQ//HT5x9qjLpM38AuOwo5Pr+za1Y5T/IhV7oSqWXAnLuLB2WCBnEExno4H6f65GYE
         12g6qUoHgEHgvRTxddURoHE8Jdd2nn9JOQHoOh+Lq+Z7KJgqwvJ0TDU9ky2YQI4rrNvZ
         9EQjzLW5tX6z29OmuTI560E8rJKyCYRWhN2s1yjRIk0Tm/nqOCQGTWHEBWwCiGQhRFtQ
         WDd+FzLPUnYnQDhtzcOii+pgVYYKpah8eDBoCnKp//9D4ozlQAOSJx5sCLp4CfkdvGX6
         S9cQ==
X-Gm-Message-State: AOJu0Yw2E4xF2V/SLqKMGhqqyjYDuLRMGKKITHXVNd5WXbeUWGN9JWT3
	8AbHT7FEYFLVPP6Zsgh998qGj5tcNhRUucP7kI06zDFRA5/p0W4nsarTvbAKs+2XHcOaqBeVxAT
	LwQtwUSEu+v6JaZZpyHADyHHP2wRIIABJWw==
X-Gm-Gg: ASbGncsu+9f7hePmRyeWaEkzEirQhi9I0O9nGjLA1HjIahgrPxkrJW7GWdd6KomrpZj
	+BBZVhkRRX8PYnpIUEXJECzHR3wC827TcXf3anhMwNYiRXRn43m4vKa/5zEeqaW1Razkg8gkbu2
	/gWGUhxeumfXtQ9je79LDuQh9i1RPvEMZMvfhSRtUzm5hdZ9pIN/sB09GeZd4OU3lnymdPXtErw
	7Nf7pQNhYLYsCoNjWdFPNNE9wTelugsHKPxCrw=
X-Google-Smtp-Source: AGHT+IGclm87ydSL49+QzinPSsQrejdcAIdA+dUrBjk5YaRkXcD87gn+2kE9WiuvkWEf0ylhE8sXm3berCKC28FI1hk=
X-Received: by 2002:ac2:51cd:0:b0:553:2ca4:39d3 with SMTP id
 2adb3069b0e04-55a04648aa5mr4435881e87.48.1752510093600; Mon, 14 Jul 2025
 09:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250714141852.116455-1-frieder@fris.de> <20250714141852.116455-5-frieder@fris.de>
In-Reply-To: <20250714141852.116455-5-frieder@fris.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 14 Jul 2025 13:21:22 -0300
X-Gm-Features: Ac12FXz0bznvDGRsXPKyEt2xRl2QsdOW2ikUFXHoPrhlON9BuiFs_wNXWUtrWMc
Message-ID: <CAOMZO5AR_6wODDES4ojA0KYmN7jcxuWgicuKBN+hy1e0EE=yiw@mail.gmail.com>
Subject: Re: [PATCH 04/12] arm64: dts: imx8mm-kontron: Add Sitronix touch
 controller in DL devicetree
To: Frieder Schrempf <frieder@fris.de>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Oualid Derouiche <oualid.derouiche@kontron.de>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_092136_168753_1AF28A90 
X-CRM114-Status: UNSURE (   7.12  )
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

On Mon, Jul 14, 2025 at 11:20=E2=80=AFAM Frieder Schrempf <frieder@fris.de>=
 wrote:

> +
> +       st1633@55 {

Node name should be generic: touchscreen@55

