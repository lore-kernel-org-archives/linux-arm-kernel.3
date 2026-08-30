Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209D0C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5S6aFJy+mT5uKBC0KX5FwDzSqvoGmSboVBAKwD0uv/s=; b=rXdu+bCDIKboSNv0UxdhLLlEmg
	sWuN1m2jijDzmrQuH2ojM1t1xdXlZwoE6DVumLXLZi/zK469bK9Jy/OFeLWpvWNxdoBFj+CS1VC6R
	4jJVUZHlTG9kjqalDhk/UUiFqqnOUxPxVyPpegKcLkPMNpLEMRc0TfT6kBp7tM1EJTQsYUqKfAlcv
	i7SeMLdcAqWye6CNwdvrmCJzuauiRHrATqVoeirmsp5H581WrPETObjpjlsFqkPEMT79b7gjVV1kz
	8HrAzjlkKoT0q43GbxwpXVLwGdXvT5d/2E/Odk2GhIt5psyJOH+TQdX68LB3O5Oqgo2rHbfcUwLHR
	46eieIAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0cEO-00000007dRV-2Axl;
	Sun, 30 Aug 2026 09:53:40 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0cEL-00000007dQo-1VcY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 09:53:38 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-52fac937235so155351cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 02:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788083615; cv=none;
        d=google.com; s=arc-20260327;
        b=WxiZgMVvR1dn/49tf02L3YGmPIscOf1GmNayR39+NWwfMChA8ySYoWn1NCT9Oi+vpc
         g6+LMEKM34Ocn/NAT5fQGnRaX16yO+s3JzuHxw/AdrDpIaoLjX20fhXwhSG8jlRHrNXm
         vMPklBCW8BDpAZ1iF1NLXe43uRCleQC3BbGGAK5JbOJOSz1++Dge6QoM1GP2wRhvxb3g
         TcTKEJVUST/LiiYh+wICfOAjFhEVpAlduwndOF1PJrFLJ1Qg/4YN/Y296apoo6DtyquO
         SqQ9eBIfyCstbIGJe989wKeka1eUSMBUltCW1gl/sC5x6zN4Bl3fK8nv9d1TOWxZPOdm
         9Bfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5S6aFJy+mT5uKBC0KX5FwDzSqvoGmSboVBAKwD0uv/s=;
        fh=GdPAIfcqFQ01spwU2JM8l3VYXj0C9SCVRp9CqCwBrbY=;
        b=QE5e8BsK8HPrWsOtedwPm+ZiR+JZr9VBzWGJTYz9wBu0b1s7o1DUgaHSRgjnUVkSiB
         fB9U0jOXOlr2iCsiErXqKjO+GVjX4DMulDSCuQPzQ66P//9q/twinPgJYPERNOqAewyn
         R0lPUB0V4cd6s04OR2sQhgd0RxVPK10Vsxlyn1sEMbntcFMehueKY7kCqAKTUiiLvMOj
         +8ocla5G5gm2qyFaDhJSqh803hAD1KM/22OezAmib6WozxdoR3uFXMv6fioB2cUxgqjD
         AuwRRXXMTjksCby+F9B1p9sq42GLY3v1wxsFEXRgWKs/KX49iAUT8ipyw7o9uo4T7OXu
         EDXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788083615; x=1788688415; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5S6aFJy+mT5uKBC0KX5FwDzSqvoGmSboVBAKwD0uv/s=;
        b=HCl+eOy/9riRH/QkSAg+9rn1chGjByuFAycqqnHvpUUgu/xoyEgPsNGbvXBxzyPzSn
         ALS5S+2auYTURn9siGwhFfKPo9rLAIyS500xH0ypliBKqpmvifMZRLTDJmbPHNXUYKIh
         pahkBvklvnH6ssj6A1MyYFaatdiuFxQeNx1D5VlAKEccIRDQfBGMhHr1htHwcByRSfVX
         1lcnhUqKqEgVxlAdVBM2CETyaED9/Y7UDQL8qUQAVkVYVomW0FbuPTfGUfx6twZRaTxM
         gkKow6hOJpFRVsK563a2PyTY5v8SGt2JWAaVkmiZEgT1ccTSViX+XGOMZ5ekn+Pu8aTP
         inMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788083615; x=1788688415;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5S6aFJy+mT5uKBC0KX5FwDzSqvoGmSboVBAKwD0uv/s=;
        b=B54SetN9sShl4EEHSei+7/3Dn9HcTLcfiZ1Ze86+5LixHnwVFvI0YuQWkznsTZ+lUi
         x+0O8s9UqrKc552hTmNaAM/BA9d0FVXVa7XVFhVbW2jpxTf6EwXE4iYMEBmCwHiyJRRi
         HHGv2t3hdT4zJMF0n3ldju7O9ad/wV7Rc9pFB7MFf5qny4bRbaBGQzKKUzqmaITW8lUy
         JMxjJosDEF441NurJja5jU5faxzey5vS8ETbYT4YqDh3hLBQ0wYbPDYqQG7EXfyIfFhh
         0cpxVAhdv79Jmggo/qG0KN/xFDTihZTPz0ne5hsapsfssoPhel8R+IpSKJhmfQAwbjg0
         HLkw==
X-Forwarded-Encrypted: i=1; AHgh+RrrJkgpN8Ko67ig5/QSnNrdVgl9o501dIIM32DI3SI6fCSXeb+A8yKvwXRrkkLwR2ZHG+vK9JziCDpjL3xyxcFe@lists.infradead.org
X-Gm-Message-State: AFuF++lXFCPKCDhiThtB+qzi2gB4hSouYrryfW9FsIe4J0ahSpXCDIVP
	wmnQh/RuMObhAZ/kgm07+tlJXk83Iu7dn9204XSkNGtjyzs6smC81N1Ez+frPS4vMlpaGkHfjBr
	fExk6geT6Y9XhQSxjdvNRC/RctJWHJRxO8EB8B1DS
X-Gm-Gg: AR+sD120X6N7Hs8Ct2cxVHxXtdxjaJrwCqbsafgaLEK+CXkyVdlLU7vOJpPlOaLEGAj
	TIKGNQa3P8DZ0WgV5is2VSymENkZBqx9tQ7u4aaEatP4MWYZVwC/u9NG34hoff7sVLsmepw6nKP
	Z4ixRblh+ifNIP6UZwEXCcVZFABYwy1ET/mRXjKR2Rfjj5qz3xKbDVyLt6QySxIxlWeCdW1TOvh
	UFYYaA2FOqiIMLFQn8ZIMt6bmOOp66LA60HZDFUIHTTWx8EGEHZi7yzpmDIHlIG7bLKFqBifZIc
	8wXtunJvMaaSNBTRPFLG616No7UccHhDjcH7ztoYEiWswlpWrL6HHECIddlzZpc+snYiqKMlUKj
	eNA==
X-Received: by 2002:a05:622a:190a:b0:528:38d6:71b4 with SMTP id
 d75a77b69052e-530100f6b84mr249421cf.11.1788083614253; Sun, 30 Aug 2026
 02:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260828092311.10774-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260828092311.10774-1-pengpeng@iscas.ac.cn>
From: Stanley Jhu <stanleyjhu@google.com>
Date: Sun, 30 Aug 2026 17:52:57 +0800
X-Gm-Features: AcwNN1UaiSHb4F9fUpqjBR1le5QyODKMu5bAeRX35ytqP7PxUTTdcqYqoVRCkRc
Message-ID: <CAE14pdeXt63__PW0Md6Vp4hfh-HTdhG=LGSRtYRLQKWk0phxew@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: mediatek: Handle mPHY power-on failures
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Peter Wang <peter.wang@mediatek.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>
Cc: Stanley Jhu <chu.stanley@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-scsi@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_025337_451663_4A98682D 
X-CRM114-Status: GOOD (  10.58  )
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

On Fri, 28 Aug 2026 17:23:11 +0800, Pengpeng Hou wrote:
> @@ -509,6 +509,7 @@ static int ufs_mtk_mphy_power_on(struct ufs_hba *hba, bool on)
>       struct ufs_mtk_host *host = ufshcd_get_variant(hba);
>       struct phy *mphy = host->mphy;
>       struct arm_smccc_res res;
> +     int rollback_ret;
>       int ret = 0;

`rollback_ret` feels overly verbose; a shorter name like `err` would be
cleaner.

> +             ret = phy_power_on(mphy);
> +             if (ret) {
> +                     if (ufs_mtk_is_va09_supported(hba)) {
> +                             ufs_mtk_va09_pwr_ctrl(res, 0);
> +                             rollback_ret = regulator_disable(host->reg_va09);
> +                             if (rollback_ret)
> +                                     dev_warn(hba->dev, "failed to disable va09 after mphy failure: %d\n",
> +                                              rollback_ret);
> +                     }
> +                     dev_info(hba->dev, "failed to enable mphy: %d\n", ret);
> +                     return ret;
> +             }

`dev_info()` is inappropriate for an operation failure; please use `dev_err()`
instead.

Thanks,
Stanley Jhu

