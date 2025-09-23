Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAACECAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 07:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XJC5LJVK1BfkEZ+6eezU7+YH6BBGIGQIjB9LFCRV4ac=; b=4mo2ft14Vb+3KL4kKCao1aQbQE
	B8TUGvmd6lhImaX0s0+1krG3TiPLvRgC0y3nJl7FoUXJ07MnoYwrfXbDKidiAerrMqS0KAkRPjZq4
	Tw/nRmcdEOCNYAGLk2VDCD3LSYURBPUUxdCzt6ykB6d+vGfQX/HPJ4tOLuslgbxZZQUHRxnDzGOJT
	ZldR4fU7GDmIc4gz9b9drWn7IYTwMRD3MG1rIyBP9I4AHVHOr9N1/dsv0HchH0iZc5Y54jMW+51yy
	a3mRIkqZ6Wm/9TLBmWXVWdZ1OUHca4AO/ZkteTKxx1BcKL93/nxBsAw7o5jAodBWV0bu4ja13F+bx
	iS7a+4uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0xp4-0000000CjYl-3EdU;
	Tue, 23 Sep 2025 07:52:26 +0000
Received: from mail.launchix.pl ([162.19.224.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0xp2-0000000CjXL-1Y2u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 07:52:25 +0000
Authentication-Results: launchix.pl; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; d=launchix.pl; s=default; a=rsa-sha256; cv=none; t=1758613940;
	b=NUHj7HNH8/AzUYwUfsUI4vVjEEVfesNKWPjl1fdZPrAcoJ5aYhgU0xyTX5XKIUCic3ws
	 0wVcMVoPVhY7KmpdCYj0JealYL1zz1xJKI9OsX7Z4f2WWaFLpRs58pYIlMQ8BEyqYqM0N
	 mtX72haa31zDy53XzWVfB9pg3h/o1O38ZDfFaqvH6vDjrqtPMIxWW9jeex92/7jDFv1He
	 cOlVuDFvP8h5eVqDZeNyR3PFu+mArRSF8/hSJry1mefEglEHNl6SDnCAz+oD+cuib0pAZ
	 nChRTwSZUusF69oUyJ7EIHfXhecVaB+5RayR6f67G+axKGw91prjjrc5XmZNweVcyEQ==
ARC-Message-Signature: i=1; d=launchix.pl; s=default; a=rsa-sha256;
	c=relaxed/simple; t=1758613940;
	h=Message-ID:Date:From:Subject:From;
	bh=XJC5LJVK1BfkEZ+6eezU7+YH6BBGIGQIjB9LFCRV4ac=;
	b=vKYcp2oPsw4VRwJ0ZIMd3LOJD+/F067X8qOhdQptmGe8bB2hD5fOxgraPb2hONy5dF96
	 /vkGH1T6xsNPVjTsKx/rhEJ1VqTItaYVIQZuKDMul15UgxuxZOyPLpk32nz+UKy/rolUl
	 qmHnbY0/zNA1Lxlx19x+9z4DBgnrk72bCa/t7FUlFR3A55iuxu3x44cEpW9EGV8SvvrLN
	 GmennIfgv5RmXh0zkTmHLke1eHJjucxlJLMGIKZFZyKy4aMwSlPGiVXHGRReL5DbSPjt4
	 Z2FRCD0sHJtQyAAXPEHbBvNWAjQeMLmX8nnViJDo+TyYSeYs45kw709yRMi9XS753xA==
ARC-Authentication-Results: i=1; launchix.pl; arc=none smtp.remote-ip=127.0.0.1
Received: by mail.launchix.pl (Postfix, from userid 1002)
	id 0E9C0256B4; Tue, 23 Sep 2025 07:51:49 +0000 (UTC)
Received: by mail.launchix.pl for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 07:50:50 GMT
Message-ID: <20250923064500-0.1.37.7nqh.0.s23qplla40@launchix.pl>
Date: Tue, 23 Sep 2025 07:50:50 GMT
From: "Filip Galwas" <filip.galwas@launchix.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Zwolnienie z CIT/PIT
X-Mailer: mail.launchix.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_005224_600992_638575C5 
X-CRM114-Status: UNSURE (   2.49  )
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

Drodzy Przedsi=C4=99biorcy,

pojawi=C5=82a si=C4=99 wyj=C4=85tkowa okazja na znacz=C4=85ce wsparcie ro=
zwoju Pa=C5=84stwa firmy dzi=C4=99ki mo=C5=BCliwo=C5=9Bci uzyskania dofin=
ansowania m.in. w ramach Polskiej Strefy Inwestycji (PSI).

Mowa o programie, kt=C3=B3ry mo=C5=BCe pokry=C4=87 a=C5=BC 70% koszt=C3=B3=
w inwestycji. Dofinansowanie obejmuje szeroki zakres projekt=C3=B3w =E2=80=
=93 od zakupu nowoczesnych maszyn i linii produkcyjnych, budowy hal, prze=
z instalacje OZE, po specjalistyczne oprogramowanie.

Gwarantujemy b=C5=82yskawiczn=C4=85 decyzj=C4=99 o przyznaniu =C5=9Brodk=C3=
=B3w =E2=80=93 ju=C5=BC w ci=C4=85gu 30 dni, a nasze do=C5=9Bwiadczenie p=
ozwala nam osi=C4=85ga=C4=87 nawet 100% skuteczno=C5=9Bci w pozyskiwaniu =
wsparcia. Nasi eksperci pomog=C4=85 Pa=C5=84stwu przygotowa=C4=87 optymal=
ny plan inwestycyjny, maksymalizuj=C4=85cy korzy=C5=9Bci z programu.

Bior=C4=85c pod uwag=C4=99 rosn=C4=85ce zainteresowanie, zach=C4=99camy d=
o jak najszybszego rozpocz=C4=99cia rozm=C3=B3w. Czy mog=C4=99 przedstawi=
=C4=87 szczeg=C3=B3=C5=82y programu i mo=C5=BCliwo=C5=9Bci wsparcia dla P=
a=C5=84stwa firmy?


Pozdrawiam
Filip Galwas

