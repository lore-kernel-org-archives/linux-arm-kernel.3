Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE14C47BCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 08:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G53t0O2Tt/dmLK4wV/1urjfV+TQ9DJgUnzf6yqxBeYk=; b=xHjU326A0TyMdEBwfcnwUlT0y2
	D5gpoV+6K/ytTiGBoG9Pv7DUmtxrOTW4RojEgM0wjxZQh1lhPVLqBV3+5HO4OC645Iz3RHrBPfCv9
	ytA61y4WZ4nqfmLcPBASF1xNQfzctPT4tuzwKunsYUQJk/UMwToyewb6e++VMzbVMaaQEx/DAdozE
	4ZKVuJKG4YuePlE2woIYLUwt8AG4JyZXMRKK9DmXxI65wv0XZtU/uD8C86+qp+ZTxjUrRX1TusLAr
	g4ZjqrNZkXM6nfx8xhDVTfYRW6JFGTX9nJKA3CJ6+hkfDJ5WPqNlTRbbIWOuqDoWbCVeZyvC6dzDv
	l6oe6RuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2tD-0000000CehM-1THh;
	Tue, 06 Jan 2026 08:58:07 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2tA-0000000Cefv-26dm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 08:58:05 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-29f0f875bc5so11041805ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 00:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767689883; x=1768294683; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G53t0O2Tt/dmLK4wV/1urjfV+TQ9DJgUnzf6yqxBeYk=;
        b=PoJy5TGGis60Nxsh+htGzmCyC2Ptz2BULtUdpcbXHz6wGQq7+vf5GMfdi/iTTXB/Hu
         yMDMs9yxXX2LNuWZs9b8WiiVuHquxTvT738MLg4MbjhyzSuebiUOzom3cnlO3ql6IIWB
         7zzHFC1/tzs3/jjnG2iAsWVkgbnpfQWg/zXFrkKw1kn2FeRzLPk3pKp9W5k2Fyz3edMn
         8TGdMWx5HHNa5Viy0d9x8YcYjh3ddB1VaSNZGDhIikm51fwnvb3VYekEqhLsHEQPPM0Q
         WYeQWEPAXz1QdZaY8aemt4YYLPWd9S90OzaS1Qfcd3qL8BptSkLOCGMIEFPNwwqxNgt6
         mHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689883; x=1768294683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G53t0O2Tt/dmLK4wV/1urjfV+TQ9DJgUnzf6yqxBeYk=;
        b=jbnvDRVLkxi4UCQeG0H87xABfgo308KB60zOmf341X/Hr1FNcDwls1+c0/z903jeQ6
         IZfV/Gv/O2nJ7Z0tpCJSesFQhBHyXNw7NUIvnZgsMB6Ss1fR0w2DfW6ErthhfNS+ODpZ
         JueKsW32eovsoqjpATgLDMa05ZUJDd4L+LTNsGFwFoVxzr98932Dwexpm2zNewrdF+bO
         8zUCx/BLO73YobGPh/wG1eVhdDPpBIOAqMR7YUV/MHb8i6tt5WBYS4u+rr6V+8lN8nHl
         h3/Pz6YP3YazfWJmKTvRsyUBQe3LfdZVxs0ukxN+R6mR0kBLbA/SOyhkNkCKwL2O7N8h
         9NbA==
X-Forwarded-Encrypted: i=1; AJvYcCUnFDpP7p2kWF4x9Wsb+KYQLaRKI0rJvpL/dbySIZHO1zZ48uDf4XIEqpLViAdawNQ3XEp4ACP/F7c3lD3gObOr@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+yuEOw2BkSHBU3xoAlwa46SEgC7I4UitFTG85azJR2pq+nZPu
	5KYQSTucliGUvlGmXVKcoVgKdJY+u+2ZQgIVn53zOa6DfPjMUk82bQjcpGJZfI7J43gn2lYG8Lq
	3h/rfHxEg0SOYvO0v+QYYlcSXqNMmDwA=
X-Gm-Gg: AY/fxX5u8HLKSlcQl0A0kouq5qCqBE/LGKRpDODWQ+FfFgQbv/Sfk3FHPJFeDMnGycM
	j9Z29d8QlCbBP9AArxZvYT9TepiANpTo5jr96DyhdP8yF6Su1vx7ZbuwQd54rjFmGB5Djw7FZMA
	RNJcroNILmUtk6u0M8+GPt1g/KOxPzaCkXggL0KJjFcStZ1hyf6/ctYZEFzjMrheuBtogpeUMtt
	bj7cbl4uSGtbdDPv20w84+NPfb+uuap0yrm2a5zbR9t/z249pYXfwNOQyUGgZ7/x5lZ/RKrrc72
	SNaYtyLdu3Wwdpt31mxPs1U0OtM=
X-Google-Smtp-Source: AGHT+IFA6DKd4Yqb25+QMHYXfH+Jh2NRCrQLjGTa8ZM9+F0Xx1xd3Jy/OMlG71eaOtGzHsmwhgEtR9fyBW7b1Rm3bUk=
X-Received: by 2002:a17:903:1510:b0:2a0:ccb9:2f0a with SMTP id
 d9443c01a7336-2a3e2d787e6mr19166985ad.8.1767689883552; Tue, 06 Jan 2026
 00:58:03 -0800 (PST)
MIME-Version: 1.0
References: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Jan 2026 09:57:52 +0100
X-Gm-Features: AQt7F2owLdGLdqQ3XnchKp1E79BKW3iLtGUJOY0QKVFPigG-8AogrAe0KMljxw8
Message-ID: <CAFBinCAZsHfYcRO4P84E6wes9rPw07Cf0h+4zS4KkbVB8vhkUQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_005804_542794_DA4FA2B2 
X-CRM114-Status: GOOD (  10.74  )
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

On Tue, Jan 6, 2026 at 9:53=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization. This will cause
> lockdep splats when used together with shared GPIOs going through the
> GPIO shared proxy driver.
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Cc: stable@vger.kernel.org
> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Closes: https://lore.kernel.org/all/CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMR=
m8EKXSL0mwOnJw@mail.gmail.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

