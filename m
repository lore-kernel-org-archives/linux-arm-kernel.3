Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A904C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 08:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nY5HP+b24Ht/fZnfSMRFxga4V+U+6O49PdW3sBxXF8A=; b=i2ecwFtgiOK0dPN/pWXurcKoiS
	iqGcfNDLzZo2IyJlhkT7oFa7g3jQ2stZj2zZ5aINRSw1bDZ6J+dn3DMORTMWIdDwPajxGSXcU1eMU
	BrArfQRc4yql/HJMIvJe1yuQcn3m5LlAAaLwachMIutT/hZMPAp3lNt3VdigFjiZL6nFvwOopTvln
	mj0Janj9nmTJebeBHeyI+YzDC0GmqLR7PHiA6uNwyapB9c/d1H5c9J9oAzP6ScCNiWCn/9s67aLnL
	uXXx4yd+qCY74G5InUYTZUfojLzEYBmBrE54zLpHVmamnBE0oS7qUhtLREV3vhT/YrRKnoW61xB59
	C4iXruLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXF0-00000003Y6G-2dYy;
	Wed, 05 Aug 2026 08:44:46 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXEy-00000003Y5N-1BKC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 08:44:45 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso30938a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 01:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785919482; cv=none;
        d=google.com; s=arc-20260327;
        b=b5qqP4fQ6t/vTMPEum1Uh1jXfFoNwZBAIbrK0QCPHTKNlrKO9zPDqPOEHcth3415YD
         IPe44GTNGNUgzWBI7hmqwBn/38qPowvF5+GuhS6URorxjlm76QFo3gSaqUNwuljLDq/W
         zCPuOqBnFE2FNCPfr2AG4lXmVgFz+cgkMXXrxtXOn1eYhVuE847hDBCsHLJJuAG3Qwmi
         TVDbaOwhVTGF42z+Aj7GzfLkoH3IRplTtMxuWjOgytuOaJfPWTeDN6vzv+79Jmo4pydg
         r+Y/SZ0Dr2QaXQ3BtrUo77BUwKqF7zeV7zWdqvimZLIolfzEQzmNKTZRUc0i02wewzwc
         o7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nY5HP+b24Ht/fZnfSMRFxga4V+U+6O49PdW3sBxXF8A=;
        fh=EsAwZdLaxd9nDi2qU2RiOCFoIlIPFeWnha4/Q+qKbL4=;
        b=KFZBYhyPfiH3kAQfN3vHlwTzDhuEjHoqqHb9IsPkNWDrtUOmeeszEEJi/15peXC7u3
         PI0e0rh5Y90D1alder9nJ1evRcGBza7RmmYIu+VBlPhrdhVjnlifFDHYYxqyqYo/eScv
         d+K5VAGXfRxO09OEKug/LNapheoL/4K5hoUGpi9D9aTVWomnh65PTrPStVchhpKI+MIS
         4nsNv040tMTHUBIWMzAijO9cJRcs0KYzZj4GZNV6CrH8WxQtr9pGk5JRi9jRNzB16Squ
         H9cpPEOjoLO5/8CgGLVpNq2fTnjcqkq/ys17PUCAPXyJIIajV9wyD/TCXwlGpoD0fhnQ
         RIjA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785919482; x=1786524282; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nY5HP+b24Ht/fZnfSMRFxga4V+U+6O49PdW3sBxXF8A=;
        b=dt3O8oYbZgd+Xc28kK8i72A0CH0+3Fvk3p1/9tQo9aYBgBQmZXKqYApkc/Sm3iTs1o
         J3Qnw8Ae9O/QgH7GLOmmeA5wbEBR6VVzknkFBUeZjoh1EQmATFyOkib73CbIeX9z64gL
         IiCQ8SgA2yhNkDVfPXnSbv/tH4sZclav/08DtsQpJB2phGo9KIelsMyhaSQZqw4tM1ju
         bTlahQ9zDj5/oDQouCEd+3Sz1J8vR5j0MtXS6sDJV0YavHebwChqYzf7DNStChMs5aHu
         lpsOxCn5Ob8aBLnulqwlKddDy4wQE9ewmm3M/E4X+gmNpBm/T4tPYtUWTpcOc9OzXCLi
         ANrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785919482; x=1786524282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nY5HP+b24Ht/fZnfSMRFxga4V+U+6O49PdW3sBxXF8A=;
        b=CQsqbCnTL18eHkeLJvy0tCJLEsLurmGx4g0mhhITWjaacjnsPjukByZuH+OSUjZTHg
         DeL/SwM61RFjSVdgmmkJA9ZD/8f4PmH3le3t4v9cfqOVsb01s3q2aAQtnNACa/ltHaQ9
         z/RGGYbFrIq+HXbFWwoIrmyWtVmG1BjSD1K1GiyVRZD+uI6fBetutS6mARWx/8UAxZ71
         Wi8Fk8fGBG9WpWOqqMGfxOEdjSJsAshY88HMpQW28yd+F2AeUpcRENfhvFIlHqMjR4uH
         mEy0skFXagh7cwIDi5mUL/qhxVrkkp9jve6f7C6sdMRf9GzCh2S/G5n4zsYVLbEC9R52
         tv7A==
X-Forwarded-Encrypted: i=1; AHgh+RqkVmaq2qWNXvMApqH1IjRFM8w/37QLHzqF4LCrtB7fI/U/ddZ1NZ2MTTZVcAX5pyolVZvVvBFESnt9mTLP5e3Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn1oI8gkrT17jwOZuHDdJaFh82jFGMp2SYLLrfV543/jWVVKR4
	bB8VTtZfH1Zgx+fT99PT5YHieG2uaKZHA1RewiIHJwdMQIQxM9oI/0pn1zFhce8t6YAUFt7gdnx
	40Oseuv+5jvIW8zJ398WFigxHduqvDgY=
X-Gm-Gg: AR+sD12nJsGhkWU7+e2Il4bbGvOpZTflmoDHJ59NiSln6pdWJkyKL16fJUn5dPhOOLW
	Aek45kKrh2ePuXaIH5cfOkuSLur1FjnhnfmF43WiqqZOuQCHKy6qf9H+2vG8qK3q9zZCUGADDNg
	Rzu1+AXvvMzXWPLVgemowh25pxjbkGHH1pVtodByvo5baJIa/tVpMao2NJwAWH8l3m5XZohR/Xg
	SiPs9oO//Q/Iot5YgF7SAwFrY6CqfQQgmWxrKeMXnj5C8t567x/qhKs66bFCOAJJdVQP/h/gVT6
	sNTMKxjuhuHYh7i8QC+k7RA4/wUjFdpx0ApCUpg7YS9n
X-Received: by 2002:a17:907:d20:b0:c1c:257e:4888 with SMTP id
 a640c23a62f3a-c2039cc4dc5mr243008466b.27.1785919481520; Wed, 05 Aug 2026
 01:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260804095648.783881-1-colin.i.king@gmail.com>
In-Reply-To: <20260804095648.783881-1-colin.i.king@gmail.com>
From: chelsy ratnawat <chelsyratnawat2001@gmail.com>
Date: Wed, 5 Aug 2026 14:14:29 +0530
X-Gm-Features: AUfX_my8FnLz2qavlfVQxZGUIEY94pPYq-LfoiMpCy0Uf6vNS7_25jGLSjfwNUw
Message-ID: <CAOeBcHP0XGCt6bbBBhDeM8LbTOmf-7CzUXW07F5_J7OmPMjJxg@mail.gmail.com>
Subject: Re: [PATCH][next] wifi: mt76: Fix spelling mistake "dowload" -> "download"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, hlinux-mediatek@lists.infradead.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_014444_402828_EE5DB55F 
X-CRM114-Status: GOOD (  15.13  )
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

On Tue, Aug 4, 2026 at 3:29=E2=80=AFPM Colin Ian King <colin.i.king@gmail.c=
om> wrote:
>
> There is a spelling mistake in a dev_err message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

LGTM
Reviewed-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>

>  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index 2f925d22b9aa..9552fadbc17b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -3130,7 +3130,7 @@ mt76_connac_mcu_send_phy_ram_firmware(struct mt76_d=
ev *dev,
>                 err =3D mt76_connac_mcu_init_download(dev, addr, len, mod=
e);
>                 if (err) {
>                         dev_err(dev->dev,
> -                               "The request to dowload PHY firmware fail=
ed.\n");
> +                               "The request to download PHY firmware fai=
led.\n");
>                         return err;
>                 }
>
> --
> 2.53.0
>
>

