Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87D0106F2E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7el6WA6ZNZjfmZVGd0QgdCpCIt3VJT2LRu865h7uJ60=; b=2gY0cSNpX/UDpr7fXPPz5QREaM
	o7IVBCXEJnwXNvwEMswGqP0JJFj+XkA3sFgJMUK3PmximBxEQ6AFYJham2pNw6FAd0RqzSAqsbPRv
	oU859c/cGGGqKtvKtG2NOvhMASDfp3wGXYG+0NvTLr+IzqUsNGKDxKJzfYmiY4DFSTgDsA0NUazRl
	dG1rvG4piRw3mrF7Tp99TUu08Dh7FVR8Nrv7ROfRUzAoFx+wsVzLkciiBz0gwdT1IOIYiNk6Zvk91
	OEFxVzM1TR+xjzI6i2rCrQ1rYcg4PWUwATd5SaQ5xPShCGpg7J0vhY8RuuuQmbeZJQmkndfNu2lCF
	HBDd8yDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fdY-00000004yeB-1QZp;
	Thu, 26 Mar 2026 08:00:16 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fdW-00000004ydo-2Pdv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:00:15 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso358140f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 01:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774512012; x=1775116812; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7el6WA6ZNZjfmZVGd0QgdCpCIt3VJT2LRu865h7uJ60=;
        b=rtI9nOp8rtuYS/nCVPUd/gp8gVzkW8bWZvsZR0xY8am6cQHKWgAdqF/sCY5fKTaF/9
         7XaQWKfi7F229X6+RFV57L9mG32wRJnIuozluqatImR8loWO6FPx+plxEoD5YRYLtFMh
         BNjmPqs0gjNu2hPm8AGQ5w4eVVdIj+F3sOSHeGtiYTpEcCtYkDCNZD6s3As2DfyeXWQt
         d7FYxbzS9+uaOryHcO/7DqE7qNUtnrcY7DKsfIm68FGhWmqzTG3cg0fUD5D3RaXmR+az
         +Wdi0LzO3PunWxZpFWKKJ9ICjHf0vyAnPUN2aDBS1iXyA61swsavumX49ZdYddF99+ey
         5BDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512012; x=1775116812;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7el6WA6ZNZjfmZVGd0QgdCpCIt3VJT2LRu865h7uJ60=;
        b=qoh7EzimCAWfs008Ezv+ePyiWBkPeMFhKdtWLKkvPj6EI9LPzLG1EXRpVB5btKWcZd
         5IYsehzVvAdQeksHDTr1dohTb5g/JQXs36/x8bDJ5y9q8lyBSqfzNjtjvB+rB7Vc02Om
         z/O0x3bbaAcq0jz8XRxdSUajB3TuIop4Q4OGIouO4agNp73kUMxY4pbIK28Pc+FA9xT0
         x0mZV6hbTNvcA8qjuQsrvjjRg5nDiZ25mjiSPbAySlWlA4ev4zLp4uouk+jVnMTKHIas
         BMBu8TYMvf4dr4ytyN1AOZi2J2+DqrS7vwzm3DLmrEMiqSTEuU0Z+X18y1E/M2aY9V6P
         HmAw==
X-Forwarded-Encrypted: i=1; AJvYcCUJe6Vs9pKlPSRIBQjyTGhNo/+BbfZTM7htt1NXfvR6Q0uCcGiDzy9iZp4+IeRRMHdVO6cjpTrD4qZW0tbX8/jl@lists.infradead.org
X-Gm-Message-State: AOJu0YzVwtXUMw+cWIfcqleT4rd9snwdECF6Fn0XTr0gn8vYyf+PrkjF
	BNRjMSyjaUNKIzPm2QPEG8a6ao38JZmvZxFGfrxBWcga8Pr3/bImjwpz
X-Gm-Gg: ATEYQzxZMZ3ythRtV6VhxYPe6w7atjro/aDzffkK/fSN91FaArhau4M3wwo/gB+eLvE
	I77JiElGLyMvoI7CDEEyHicTkIjkD3TH9yhrGstCHC4VtRdXo+qvFUtY5PqE8jvoXyF3XYJWyFq
	m3iX0yabjHro6xscmVm6Xh85H15IOqki3DJROSd9alC8T3LBm+tzJjObi7h8uVvF2NP1ap65KtN
	WM2G2ckLXoH5uNY6093hO7CFdCF01dIuYSL1d5OXxbdOD8s71HfwvMeHFXXo1d3/TbX/dYIuN93
	m5afZaFjhvjceU+T8OGRq9SUBhPTuL6ibLuyJheRbsWct1QmOYCVDCs8lPlN31YmJwIbeTa1Oc9
	oMV0wemJojc4T7ldNwED/LId181NJF2UPw0ITyFXM1selj12/uP9U0umIx7eOVb2yfv9VkjNgIk
	nO0qHfwUiiprwFiFP4UJSSEI2qCp9HkGRbJRLUXXuB/U9gkkaG6uaY1yluXbvV4wZQ420fAgCIc
	o3zIGH+AwOkm6j2PZg/QyQvr6VeAPkELjFE8W71SNt5KD0Lpq/zYZL2iSSPpTDBQ39NLj8p2w==
X-Received: by 2002:a05:6000:240b:b0:43b:6127:2510 with SMTP id ffacd0b85a97d-43b88a0cb2fmr10393835f8f.42.1774512012165;
        Thu, 26 Mar 2026 01:00:12 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e352sm6284811f8f.3.2026.03.26.01.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:00:11 -0700 (PDT)
Date: Thu, 26 Mar 2026 09:00:10 +0100
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Francesco Dolcini <francesco@dolcini.it>, 
	Manivannan Sadhasivam <mani@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Clear CLKREQ# override breaks functionality
Message-ID: <jfefktil6ywvugvbxdplbvry6g5efka5g4bpr2dwhha2mtrkm5@6gkcmj2glvwo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_010014_620446_56D395A1 
X-CRM114-Status: UNSURE (   6.59  )
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

Hi Richard,

While integrating the `supports-clkreq` DT property on our iMX95-based
SoM, we had failures in our CI on one of the two M.2 PCIe slots on our
development board. 
The failing slot uses a card that does not advertise L1 PM substates.
This issue comes from commit a152a90f5390 ("PCI: imx6: Clear CLKREQ# 
override if 'supports-clkreq' DT property is available"), which clears
the CLKREQ# override based only on the DT property.

It seems that clearing the CLKREQ# override should happen only
when the driver knows that the downstream device advertises L1 PM 
Substates. Otherwise CLKREQ# should remain asserted to keep compatibility
with cards that do not support L1 PM Substates.

Thoughts?

Kind Regards

Franz

