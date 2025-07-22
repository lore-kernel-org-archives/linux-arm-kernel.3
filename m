Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D950C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 13:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ad0eWcS05AQtec3r1PLfGkWoKzWnCdTiBnJpsCLhEdY=; b=asxvTaz1/YmU0Yj7p2krzKQnfd
	NSNSyOn55HeTV6XO/Sb23ZZS91JkcVpywGwfSIIgjmdPf74+VsWVLi3JpfMAk46khYdT7FB87xEpY
	oFdhHPQ36fqXXCpsMDR/QJ18VuTCk+onl3Ne+56HsV7hgNnpYKOw9UZ8ScUb8blVgD1+5DBAConHg
	NsWJkcIzZi2H/O5EIlJHbSNu1tn66yRmRcZSy1hQ9fH5MC0RO8dL40mz/aOmyr4DfhzmUIz9nawEx
	pCkavCOnYfxtPIB79ZVuNX6hezAHDFoPNGMPYJuvUkdc59Mqu8MBwJ3J0KK6njkKUBag6S41iG2gC
	mrIbyg2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueCtU-00000002X3C-3Odu;
	Tue, 22 Jul 2025 13:18:56 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueC0B-00000002PnC-0fqi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 12:21:48 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a528243636so3269211f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 05:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753186905; x=1753791705; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ad0eWcS05AQtec3r1PLfGkWoKzWnCdTiBnJpsCLhEdY=;
        b=Ld2Dkl4zDxMdQz4nn0j0V08jFBGmAz7qB6Dqu/7ov38CBTYQsOi0uevpSxZYzIyXbT
         cWcRXHpAmD00EdMO8CIFY5NyRcpL+x/KYZAcXaaybzWb7oIOiOlEbQhkEimjp6hdVKTs
         ygmUc3BQeM/SgwZg/Pb9/yiWRjbL6TXLPRYDjLNlxoprOl9h6pLxUwh7D/+fXW3+XiRS
         vyGWOkPHYAxKuDt9T50J00X1LZ0Rn7JBvB9u76Hiw2kqJGS8vFSOQBHxCQSkWaMv3l/+
         zJQe6gIJuMiRWItjTh2aBu92zRxGBpxrTha+BByUdkJ+clEko/PXWaNwrenMpHYZjuz8
         8Psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753186905; x=1753791705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ad0eWcS05AQtec3r1PLfGkWoKzWnCdTiBnJpsCLhEdY=;
        b=BboVcNiMQmNsO3NHmenh4rIUbZ1FZb5kZkFLtbSezpjdottL7NKEf7VBPiR8A9KtvV
         W0bZdFIcfsiuFcurQrVxcNMMu95KcgJm8kCOiobakHE1gM5KLhCZOaLVI4BB/kLrZA90
         DD0A6sOlU5qg8I0HINAq1FmsCeFNRWTzwrAiL4CFjybTUp7IZvWFTcmUQs0gnxs2EpP4
         iZ18ZoSfBvXoesAobfJSx3Tw88BzU07GIssjWhmW4EGC/IxK2Jsso8M4Syzoyk9ETLcR
         W6vhKk/dKF8m4nk+s8w6OKEZc8/He1UL+78xcdmvJhEvojdPdVqa83Z/D7Kb1n350VDr
         ijFw==
X-Forwarded-Encrypted: i=1; AJvYcCVCvJ/qcGRS0lM5T7FcHOFErMWQ8JAT3BqIG7Ksahh1JX2n/cdGBE4ItqPxqhlFfZ6lUMVXJD7SgfTge1iNcKxu@lists.infradead.org
X-Gm-Message-State: AOJu0YxF5Jrw0IlxU97ffIIpdW2Rtnt8iGgseerTe5A4ku8ozqP2w5hw
	K7y7jvVe3okdBvwTg2ppwa1Aog6jnbK+yB69nZ0j1geaekAsxvycwVSs
X-Gm-Gg: ASbGncs/3yUdfJMcpOeTMXlljvp8idfrI0HppdAGAVMzf4q+ZcUg0MsSf00J587z2t1
	LHO44zF+LUfE1gMh6+ubTbfr9XopNR803yWJzznOmgOMHvD8dVF7PaS10HKxGmhvjme+q22lIOq
	urUdhZjAi23N2I4nPHTRY4todtBLi9E2QwTw3bU62YrFzGfV9QcUaZsmzE9uXirmsnXtvsRk9jo
	i2E6DPTZRVQSMmkEVMZXdpWltXa937IoApxG8oOy545qJo/DTp7O1kKH3K2CGk+9G/3VAZ/YBYT
	ET6Knx0b0M6mZfucahsQSf5bdpN+SH8lNtY1ZvsDWXb8K9OwHW+NUlS0drU47d9Yg+L8vXBMaMg
	kSbnsHduQPr/wOuy7WX3PsUZVPQHyapAwAS3s2fvIE3mMJLcKz38PasZkx/6TnQPNlpRGU+vI0Z
	1eMqAb97hr
X-Google-Smtp-Source: AGHT+IGNcA3sbhxOlCqY/l1NPEPhYR5vIqHTTHrl6r+GnoE5v0L0OgDqGJHa+qfDhsDIJ6agL7cTFg==
X-Received: by 2002:a05:6000:40cd:b0:3b7:662b:705d with SMTP id ffacd0b85a97d-3b7662b7496mr910235f8f.48.1753186904968;
        Tue, 22 Jul 2025 05:21:44 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76455e57asm1897701f8f.21.2025.07.22.05.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:21:43 -0700 (PDT)
Date: Tue, 22 Jul 2025 14:21:41 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org, soc@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 7/8] arm64: tegra: Changes for v6.17-rc1
Message-ID: <izdiwbkuipbzunqot7zhillohtfcm32xrk5ydu54bamumfgkpx@p6ikuhkv3bkj>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
 <20250711220943.2389322-7-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fqns36t46xkf43gi"
Content-Disposition: inline
In-Reply-To: <20250711220943.2389322-7-thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_052147_199456_8DBAEC8A 
X-CRM114-Status: GOOD (  12.68  )
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


--fqns36t46xkf43gi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 7/8] arm64: tegra: Changes for v6.17-rc1
MIME-Version: 1.0

On Sat, Jul 12, 2025 at 12:09:40AM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>=20
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-6.17-arm64-dt
>=20
> for you to fetch changes up to d01e4f1e7aa8833f549ac61a0bbcdc395533269b:
>=20
>   arm64: tegra: Add p3971-0089+p3834-0008 support (2025-07-11 16:57:47 +0=
200)

Hi Arnd,

it looks like you haven't pulled this yet, in which case, please hold
off for a little. There's a missing dependency on another branch, so I
need to redo this. I'll send an updated pull request ASAP.

Thanks,
Thierry

--fqns36t46xkf43gi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmh/glUACgkQ3SOs138+
s6ERKxAAmFMQZ/Cz4E1/SKyZNnC9aV8KA+fjrVHYHZzCnkwFSKmoC9NkwCWgbdrF
E1h3r1fxrb8nPtej1NiDuwnKhxs6aOsmtlRoBhcUGKO5PatgVWtjSgb1cCcIjdPk
rQnedQ0CYn/RHmB0lJbwST4jzqFL5FHGJ/90/XBA9AXGi0JqfWtzUeymAXk7RbpQ
YANpZwnoLtRNx/F7zEJRNXEA7pQR/5tizYVJoEREqJjS+wSpcNJzwA7d45wYmmkS
AnFmFNut+Uxt+UeY/DE7I8Xk+Lisex/EyirsiPsjRLWp4eYOOZIOlBqZjqIR99da
RqoOqIhXbuqYiZF2pI1RrJDQW4xlSoo922bQvr1EjmMKUZ+A8DyURYGkHxxxf95g
x+yjya0vWkFr5bZI4JoonbEXpBPkE/WJx84fnKH8t/M4xQaxtsWtdZTO9kpJxsGF
mzLtIpwdIxr5uXL07gwcoE/BjBxvmeCig1rqhTt0VL9RLFDAhe2eVLd9mEe5SkmO
2PIyCknJfDDbSpt5tDbzd+y5Zn0/hWfxbqZtD1KEg1QUGxncZc4/rc/s2fr2LQg/
SjlgViowGlhj/+o/QLBkyfp5hy5kK0ZjSi5rJsOC+iUefpXgLFhehwGbX/OPfI+R
qwtbt/DbrtWjMNS+/jCBZ0ZEMr4tIdFHnDVzCj0Wx9TzZokl1PQ=
=rtRy
-----END PGP SIGNATURE-----

--fqns36t46xkf43gi--

