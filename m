Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90A6E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 13:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfiIlfNISL7LxmEo4PkSBvNVf6zI03QBaUXQpOsHzBk=; b=PqtgTS6MMH0ZPa3xVg7xD2L0eK
	a+k3yjGvq1estC5qCb+lKyDMXSxy4hTIU8dobt/wBobmZ9Y2M9lYWJ+2G9lzwg7v2IpJB5s1A7Fmw
	YmDJxMT0+KosKY47+PCghRTPtoB11FGMD7IbLGBGuuT5WdizJS+nWgFg3dpIy/cJuwJvv/7uqJyAr
	QLX1nRaBP45uKp8I/4AKSywU9sZhy+Ew7HTsEiYCndUjFJim+ANSGyoUES/vFNhuJtc1P6Yz8BSAC
	I4rqKoV+3bdXjiQ3FC9X2EBkoQkCXqSpl7djgIiIPKfeYMcmOmGlYrs3yd3HDpYkjNVvdi0XpRQxJ
	UVDrLx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNAos-0000000A3BU-3elg;
	Mon, 16 Dec 2024 13:07:30 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNAnk-0000000A2py-3ZBb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 13:06:22 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-46783d44db0so41289851cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 05:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1734354379; x=1734959179; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wfiIlfNISL7LxmEo4PkSBvNVf6zI03QBaUXQpOsHzBk=;
        b=eiuUlfLEC3PO+uptPhYEn5cpWnv1jLk7PJaMa40ZPM+/AX9NJVKDmDrzJf8AGHjRDn
         l3LXD0nZBC8ytnSfKh4Gb2I48jWbk8hPE67LK8dF/UsmCrpxMUW38uJJA76O5tL1z1cZ
         FNba3TeJE33AFyXWbgYeXx4Qy+Ji3XZFLoVd6+VTMMLv/qMAAzGC0g0odBLhD3RBws3G
         enSCsThvnKkMlQkkAKfF5eQ+h38InKQ9uO4U7BSXoJctQDwIYRnzM/VwnDEtcu4toqlW
         3tRCav/KKZOXVZ4pIWp7n0SQfqS0zjkLRom2gc7J5rPtEx/J0p/i509L/Wzdo+oCJop5
         ahVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734354379; x=1734959179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfiIlfNISL7LxmEo4PkSBvNVf6zI03QBaUXQpOsHzBk=;
        b=l1oKgH9KohLgdjsM1DKCdGeQGffwkT3ZDkRugX6gfvSM6Wlc4bbtyMu8e0ErdcO/lm
         wop/O823uD8iplRBSqIZiKK1UXKEBnxl59dEkNZ6kBCSgZ2x1WZi9vbnkO+z5FbX9WPq
         sR53oSzLsKSUECCUnStC05ESuCQ8jId0+pqcC7AnH++dOl9I3tLkk7iJigM3oNHT9w0S
         HlO5tpd6VR6iLKTCCnletm8sgBgXQgrZ/Wee8pN16L3RvpjW8W7l8wogPZHi7nhN32Dw
         4okB2gAOvs2qAd383X242/tVx2eFgk+wkss+8Zm3d3M4y8axCO181W33mX77Cy3tXrpX
         +O4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGeE+ysXl2Btne4nja5jY4Az8B40rdXKvdn/SHZCNlFSVqFpuiQGfxKDzYG0QMmuGrquf2E6RcotVTv+j9TP4U@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpmz3ouoyNU5I/11AGwTZU1KI8O1vPXRD2yUvkz4Cn/wIiDHwW
	J9l6XXb++ub1J8cA8aG0AOFND17vejb/bbXTHJpTtKIfhWDa81UT4MtqolrQn3MXj6Ff5Lw1ju5
	8CtgxzOsIGwuzJ8FlI5GxgWsSazN149gyIjxYZA==
X-Gm-Gg: ASbGncsGimCGZXFxv8TbK4vOvAPD+947rSkqBdLIoNqwkEOJMYt4aD2xZO97ywk1dWI
	xVkYUKKRD4w59n5eRv1rOJYSNMS+GMhY+ap5d
X-Google-Smtp-Source: AGHT+IE9Cnqk1RFA303SJ/sEM1uxY2IdUkOrI2lN1tMljvUXQswUAevS43+NhsG6LahpLoL3T6y4Oj0/rJaBAzD6y9Y=
X-Received: by 2002:a05:622a:454:b0:467:45b7:c498 with SMTP id
 d75a77b69052e-467a577b4c5mr198761341cf.20.1734354378718; Mon, 16 Dec 2024
 05:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20241214081719.3330518-1-andyshrk@163.com> <20241214081719.3330518-9-andyshrk@163.com>
In-Reply-To: <20241214081719.3330518-9-andyshrk@163.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 16 Dec 2024 13:06:07 +0000
Message-ID: <CAPj87rOjqZdyht2y8MK7gVyk_eqEzk1Sy0DcxFtQRuhrHQ_oxA@mail.gmail.com>
Subject: Re: [PATCH v6 08/16] drm/rockchip: vop2: Support 32x8 superblock afbc
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
	s.hauer@pengutronix.de, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	derek.foreman@collabora.com, detlev.casanova@collabora.com, 
	Andy Yan <andy.yan@rock-chips.com>, Michael Riesch <michael.riesch@wolfvision.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_050621_050876_D5C7144B 
X-CRM114-Status: GOOD (  10.46  )
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

Hi Andy,

On Sat, 14 Dec 2024 at 08:18, Andy Yan <andyshrk@163.com> wrote:
> This is the only afbc format supported by the upcoming
> VOP for rk3576.
>
> Add support for it.

Out of interest, how was this tested? There is no 32x8 modifier in the
format list in format_modifiers_afbc[], so it seems like it shouldn't
be possible to get a 32x8 buffer on a plane at all.

You can use the drm_info utility from
https://gitlab.freedesktop.org/emersion/drm_info to validate that the
list of supported formats/modifiers for each plane matches your
expectation.

Cheers,
Daniel

