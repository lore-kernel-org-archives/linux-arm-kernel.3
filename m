Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C46C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 18:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgwvOoLAHdeH5x1LPpK/Ic794djJ4NRcQySFzYPO0Xs=; b=lCbCVgxm6q/6EnkAcCpI3FmQWa
	sKJgiuCLMGpP5eht+6Yn3eTqe7VwzXl2WfOD4a8ie/pomf3wbJpbvw+E7/jOP4WLafVjqmQH3uI1v
	5jW+3SsRDTnHiNoFHo+1w9nw1ANktAkpUcWlDoJuWjPqiONyLNbd9HE6vgi98DKBjFhw/5jDZvDA/
	WrPaYq9i2B5D3kay77mFNWS45qAPHGqDJ/ieFzmVyxeJNwkXLlysDTrWhSSFevLGDHRAlYVMX6GDh
	Gq+4P0ah9aZaAQibgLra/6vvztP17zPbofA+08e1ncK0BwRdSJndUgeTp96Ybb6k8DwKkyETI1RqZ
	mRrO124A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDUd-0000000Gm2a-3sx2;
	Wed, 12 Aug 2026 18:15:59 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDUb-0000000Gm1T-1p9v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 18:15:59 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c1712a04ddaso218409166b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 11:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786558555; cv=none;
        d=google.com; s=arc-20260327;
        b=NLeg9UMLi5yZP7La+54a/sDBEOBuDstHsvvk3F1lAvGMh7uBR5ilSroqB+U6zp9Pa9
         sPGUpfBPUKCgpMTTUtuYBYM4JDo66ZZ1yisMJSSprXh/w1Ca0GdEbGHUY+R+hHCh1qrD
         y1CLH2S3NMu9CHQSDLJl8uwDAd5TTEpwsM/AwvSWhpUQLZzo6hOZrvmJ9TpHu6TdL0Ru
         zISpyyEOXs/O9UnQRY+A7F32eM85BHQf6s02YIenTKdnIC8cwisM8cvxa38xyycrNGJ6
         qyE3bpIthxOcIHCyWC91J+pqPv4+OQ4spQ4Xwg/aBHF8/Mz/hugAWW1tMlrp1Pvzb3bh
         8Auw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PgwvOoLAHdeH5x1LPpK/Ic794djJ4NRcQySFzYPO0Xs=;
        fh=ZRW8yR5VAsCgvatpkUdaQvw+0UWTQdKPy3RjPL31MkA=;
        b=DLtIxiNWsgVKUTjnDKWAhElkC+4yOtCten7CrSRX5a3935tCfo6mucXzeLra5wXWWr
         am/0VrGOmzxAsv/xX1n1Z1XUBtxf5w84wTQWRs/+UI+rhdtRrtze50WCM1JwAh6CW92K
         hVHCKGNAAJ7g+jvapdP14qWlSTT3rt+F0f5Ubbv8oVQ9bjaqBazG7PmPjfVjpizvaz1G
         3gna9zYdjocolcsiAm9d4b/iSgmqo1joAwEtgSMqJgcHtwO6bXbgj8rzPijhmWqF7CbC
         8U0z/A16jR/w0AeMMx3z3W7JfKqnrZOEnFOQlTy4zA8qB6jWRC6Xk39OWmE0JvBJxb8z
         M5tA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786558555; x=1787163355; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PgwvOoLAHdeH5x1LPpK/Ic794djJ4NRcQySFzYPO0Xs=;
        b=NnUnDbAYTQbOwj/fxcFXA9n2iavnR2lp5BkZkAi8ybEwdmAlrLpefxCKDZTGO7RdRQ
         yse/7WtV9ZxNI31ACFsnfcFjvsNPy4Ztj5uvq1SwtI/Fgnz+Z0TAmNJYrnwsgXjFm7Zt
         ZpWWZxeLETdb5NdxANerTHuCGNJ2rEKCPLOMkQkXnvnZZxNFO/AXacAwNTaKkIPPooW2
         sAkW0rc00GPgwEvCAgPhg8r6ap0vfTC6j+kpJVJgwZsU8yXqK4rEZ+Ulg0ZX42uZOnMI
         kT0OGEBe14bHSVvGaGu4lhQyNAK6y32/qCoTCSOCIl6WcPmXP2eiXNfQZ5h435PwOyLB
         Bayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786558555; x=1787163355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PgwvOoLAHdeH5x1LPpK/Ic794djJ4NRcQySFzYPO0Xs=;
        b=Bk+hUAioloOYM+4+xMzGqJHUw0kKhmf2X9ieLO5bFRpxodxOHRP5wlSmrfwXaozI4v
         mPzS/h1tTNZSWSG7Wy6qAdF9LkxWBniwZY66R+iZgOB2KxaGKJGE9GIeoh14zW4/3gfI
         l8+AXYP2ZNSY2YUIa9/0of2ieMa1DYzo7tS7VacDzRK9VjFLJ0n64aeWSXu+9ECHQQTs
         emq5micPcsW9lP0E4YdN7dMyBwUmi1o+hcdHr/IXE6gA1DNb+rE5CJU1UgE79KQFAPwF
         ClNzTg4wkufYXrzif7xLABWE/rgydqdYfC0pk+nJ5RQUbNXYpv7krXVpbMZfJ7nYanFj
         Hr6A==
X-Forwarded-Encrypted: i=1; AHgh+RqtjddYHXr6ziC7S1rt16T3W3x1HzbS7UmPeEqeA76Ebat7M5gBeAmtunWkUxnGykTOh7BCm+MJTD/6QOBEr8ay@lists.infradead.org
X-Gm-Message-State: AOJu0YzLToY2s7PCJgxNn9FER8nLBxeEOYzqXCuUnA0Rv9EUW3eyMRT5
	rDkicCaXWWq5Qfk3Su9bHV2MbTNIQbYvJblio+rHIkIXjuw87Xprd74JBHcODG09xIP/9gl+BN1
	rj89sTrqcO4jW5TB/dppz7dYSLudesWw=
X-Gm-Gg: AR+sD12yPKRIyDa82e35p7Qg6GNWOePHk12d/GP8/mXGmEg7q7OgzcqBZAnXZoJF6qe
	+xZPnTRXLKhsXlhN46P/eXw6T49amplMlCF8hBkK87gBI0Z1OJ5KCJ4gYphST6tJhTf0ecWHkcl
	bXHvlBCfjoUlyZpKeSI7KpvwFMjlFMVrLMdDsmsst+en4Yz8CIUItktGnSbn8rRGdss4lQnDSnO
	Rr72jSvgf7dY0TGwIVLtIBnNwMYS+uibkfOUsMVTja9lWoI+4mhXInd7gJE1Fw4wVcnEqrf8ziY
	gbVtKdyXOxyhpx/uwQOIqeDCr0Oss0b1fevwCo3bnp6HCRx2QpB6FnWMtahUuH2Nb+ay7sUMJTY
	rIDrSRQn1nqvQQM8w4/EswxVUxvLlSsHkvE8M7RQIQuuBzczxX0rAYIANAGitD+pRYv7NBSh3Ll
	wwFy9Mb3sQdG0C+j/FFI+3NfTlnND+lpTFhL22/Mwc42azfZss2PBBJZQ=
X-Received: by 2002:a17:907:c0d:b0:c20:899:b8bc with SMTP id
 a640c23a62f3a-c2108ee3cf0mr7867166b.6.1786558554870; Wed, 12 Aug 2026
 11:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260304041400.7236-1-rosenp@gmail.com> <djjg6jwpuu6l5wcc7zbxfi7j4n5hircmhivxohdtgufzrp6rlb@l6eyfdyfrxix>
In-Reply-To: <djjg6jwpuu6l5wcc7zbxfi7j4n5hircmhivxohdtgufzrp6rlb@l6eyfdyfrxix>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 12 Aug 2026 11:15:43 -0700
X-Gm-Features: AUfX_mxqbIvZ73kcSiSnSMXY77gQTI6q5M4UWPSGxgp8t1CwI1GTwLlXmGpI4Co
Message-ID: <CAKxU2N_VYNgYKhS11Frzio4fbg_ZnDsvCfEypvxSiw3-JV0_QQ@mail.gmail.com>
Subject: Re: [PATCH] phy: mediatek: tphy: simplify main allocation
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-phy@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"moderated list:ARM/Mediatek USB3 PHY DRIVER" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek USB3 PHY DRIVER" <linux-mediatek@lists.infradead.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_111557_500155_F8F56911 
X-CRM114-Status: GOOD (  14.11  )
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

On Wed, Aug 12, 2026 at 6:32=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Tue, Mar 03, 2026 at 08:14:00PM -0800, Rosen Penev wrote:
> > Use a flexible array member to replace kzalloc + kcalloc with a single
> > kzalloc.
> >
> > Shuffled some code around as __counted_by requires the counting variabl=
e
> > to be assigned first.
> >
> > Removed NULL check from of_get_match_data as it's never NULL per the
> > device table.
> >
>
> Please do not combine multiple fixes in a single patch. Also, the NULL ch=
eck can
> be kept for the case of sanity as it wouldn't hurt.
hmm? There are no fixes here. Just a FAM conversion.
>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

