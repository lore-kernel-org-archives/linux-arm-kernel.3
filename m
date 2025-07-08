Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059DDC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 15:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ilLnM1nkDK5EG4IlWePIEBnogI1MpE46KJsgpSIvj2E=; b=EMTy0OTcU2Xj7JkWH5rh/ybJPt
	ylntTCdQ+IrdPUT5qF+3gkGRMTQ0m6TZiS70RWqspPjGJ1ORSFV+UyHvgd50rlCXUenyEwDwRGVnW
	b3qy+d14anvHMCPtEt1hHsGVzia0bKbHOuXQ3CPVuahBKiUY5EU7lgTe0nj0plKyC5m+s8EAQ/+vL
	GU/UkD+gK6sGdlC+VA1ihFTxbB0PpESIxttgn5kgJ1XkLz9IsJ7syMd6ynVFZyrI5dlmCjr0E4Ohq
	6Gt1mqD/PdM5/3IXQzwdJRC1e5c4ARtzaYywOWkonOkJTVB/gkkfvSOnzvPEWcjbdm3pbS2flSJpA
	ZAo8tkgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9rr-00000005hmw-3S41;
	Tue, 08 Jul 2025 15:04:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9d2-00000005eyv-2XEu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 14:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751986143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ilLnM1nkDK5EG4IlWePIEBnogI1MpE46KJsgpSIvj2E=;
	b=Vc3FcvVVuuNO2J1oh2SUHtg4W3P3QeaFz3+tRl1ds7+1dfG+ncsg6f9bqxRyxjUFmaVXXy
	AYNGk94NKO1yVHK2IPkMYrAWQ23vjB32CyQ5iRnMEZis9/2n0U6q+QmguGIGCLGMFsfSX9
	9pMmlYjW+D/3t4lI6EM4vIGPo+QnlgQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-O34orYBwP1eJ2NnOIXKT_A-1; Tue, 08 Jul 2025 10:49:02 -0400
X-MC-Unique: O34orYBwP1eJ2NnOIXKT_A-1
X-Mimecast-MFC-AGG-ID: O34orYBwP1eJ2NnOIXKT_A_1751986141
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f7f1b932so2954455f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 07:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751986141; x=1752590941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ilLnM1nkDK5EG4IlWePIEBnogI1MpE46KJsgpSIvj2E=;
        b=GLMhUVgc002MINCX0BWtfBO6eFiI14HVjxVJVR5FvkilAa2HHSV5HYJRXR7TmqwcfQ
         Q9QSjpW1wCy0N1c+9adh668eHy39TY2VDjRhH6pRTKdA3DB5MdRMhXLdzg7Az7Op5xxf
         R9X42YMa25bp+DwLr+wPAtY0A0xy2O9wePwMLs4UKcP+/ih965Wc+ikxPBKSIujqHCY+
         O8NliK3ko3bzq/TyMrSZV5bETNh+3gTp/XcyIkDXEneI8lTVo87AX3X+igZ6ENU9NIoa
         oW2efaPUWx0pmE2xsRQKg3YrKGFVGtEAF92TsyOZtPcCj6OBerV89c1uOUTrUN5w3Gt7
         PLaw==
X-Forwarded-Encrypted: i=1; AJvYcCX8p4I+XgH+O5f86Z1iV7Un24lbdYtPB7BeTzWkNP/AuTW/5115CjuzryklxKz1mFamkzY9rIq87nkq+NJGVAzX@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo3G5AlJ3v2JI/B0fJI+GcgKz5gnGaErzK9fza1vAjvrDirjQE
	jb1t0+uFCU4mgDdzX5AxeSey9t0KzU2XT+hptiBp4wQx9ut9FCXgo7uBC32CMi2C6HhCRghqQpc
	dTBfl50pvcDgLI/9e7FK9JU0PXY6cDg0eVPm7Gsc6LelG9WB3+jGoTd0q42T3cVGwq+a8agLbTF
	g6jjBe6reRCEpsRX58ngGtKNTEylJT18TwVh/+1QfOHU7KLzWKkRo=
X-Gm-Gg: ASbGncs+MHFB/Zw2TPtEsLGFy1gDAyM0TBS/CrgILdmWUZKX26XPAGhJBiYmqtR0RPb
	JvBuKRyxAQ5V3K5oLwsdeyF8fEA9O6d2rDC5PFX6UMf4SvlvCag/PU8GWhYX9e7lz5kj6A6eW11
	d01Q==
X-Received: by 2002:a05:6000:2281:b0:3b4:4876:9088 with SMTP id ffacd0b85a97d-3b49702e7e1mr13523178f8f.46.1751986140853;
        Tue, 08 Jul 2025 07:49:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNmhF5tEibNLSO4zklVeukkffwYibjFI3qCmoKoreWsosWzDc7FRBfrG9K0f+Z6MixAgDUVST4ozCaCvN0Rx0=
X-Received: by 2002:a05:6000:2281:b0:3b4:4876:9088 with SMTP id
 ffacd0b85a97d-3b49702e7e1mr13523163f8f.46.1751986140408; Tue, 08 Jul 2025
 07:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250703100544.947908-1-maz@kernel.org>
In-Reply-To: <20250703100544.947908-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 8 Jul 2025 16:48:48 +0200
X-Gm-Features: Ac12FXyc1eDwUfgvyIyyq8lMwH--Dkal7I5XoAdK2HIbjIFxeLbn23IfObIwnEg
Message-ID: <CABgObfafDC6m303YirQvgYdfZxZ6fL0LmU4H0gKdkGGv9QvVeA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 6.16, take #5
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Fuad Tabba <tabba@google.com>, 
	Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0Om_CwXt4_eCEt6s-X-LK9gA-waVGV7dSeU4BdC9nSA_1751986141
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_074904_711978_8755F53A 
X-CRM114-Status: GOOD (  10.22  )
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

On Thu, Jul 3, 2025 at 12:08=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> Paolo,
>
> The one-fixes-PR-per-week trend continues, with ever decreasing levels
> of severity.
>
> This time, we drop some leftovers from past fixes, removing the EL1 S1
> mapping of the host FPSIMD state, and stop advertising bogus S2 base
> granule sizes to the guest.
>
> I expect you will bundle this with the kvmarm-fixes-6.16-4 PR from
> last week.

Indeed.  It'll get to Linus tomorrow after the KVM community call.

Paolo


