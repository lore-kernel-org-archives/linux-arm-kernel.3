Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFD7D3C927
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 16:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22GFvVwg6CTXyoOy4IhLZub/bJLrt9ksV7TaLrUKxsA=; b=TJNmchg8Kj4KVL7DP/Xu3hsqb9
	JIVZPfQy7wlgrgA3dTp+9hy2DRqMJnjmToLM9HyPedKnJnvWzyiYCIFxfjkEfqC3wrbgO5FdhSPB6
	zuJpmMFPVBxa4FnjY00DOnMyZ7BP/G/bZVPix/tU6p2IreAB0O//bIODkT7JloCA+mGJx3zyk9YR0
	Yy/6l3mU030H5gJulPpVpmTNBk844IsKblSy85hoKk/FXn1yqsvxXxSp31Z/ysXWKY9VMJqoZExf6
	OuY3Mb7dFL4Brf1RuRGEPXajLwDbfrrxGFiBhANmWtoXX9PfKoRe/s8U58OLWrgRQJopPtt78GO0w
	yOlYjm3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMgA-0000000FbUh-0QTa;
	Wed, 10 Dec 2025 16:04:38 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMg7-0000000FbTy-33H5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 16:04:36 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-8b5ccceb382so1713885a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 08:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765382674; x=1765987474; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=22GFvVwg6CTXyoOy4IhLZub/bJLrt9ksV7TaLrUKxsA=;
        b=ejAHL0SednYgX0gEMBrW5gAMOXPe6qA4ckMV+12VXArzCOPNaLAz95C0NTVzwIeoQB
         QjHfZOYmpsxLQ4NLnSN/pNp5ZJ6w9f7uOFBLAHHn1Jdo7UXXSULfRHN8x1L8lciYDKAn
         9I7K2gPQk5gWoWUAAUtqU0dsA6ockfsKwuKhCiKUzErDa1asv7+wa8wh2A7Oq0YG2kot
         RdFjGFAckIAXL7yHu7yG2tEi66q5gCNWGFCKSluul/ZXK5DA+2l9o3/Ub3YQcORASimu
         GSkyVyTTnBw6nq0mwrfMpACGLJjQeR8Dw+78t3KLydxL694OZAmT4itAr18c5mS4n9tS
         DL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765382674; x=1765987474;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22GFvVwg6CTXyoOy4IhLZub/bJLrt9ksV7TaLrUKxsA=;
        b=tfEwU49L7BQJCLs5QmitrJkPDR/JDDwacnGgMgllyV4QMShwz8sqKCJdkLkxisiXy3
         6bU2M1btL0/IxpGHDJW+y0TWA52q2R5WTpEYzw7c6KtMo91oR1vmN/wwvVbP+Rx19cwn
         3gitHh9/3PIaYfYr9e1dnbHaCiitCEx4CLTJZ5+6+URoOzVQJiUGeS7VhSmChaAZdW6n
         XYOwFfZlpyMP2pTSYXhzcTdyAEDsmja47RFEHbpin/QU2AXSaPwws5gfLwB+irJa2/b1
         WRIKb2jtKYPt5T0rZIS43JuWpCdrmQR5de1rb5X8T6zYpaoKoZyy8flGM6Wr16DfnLzH
         fP7w==
X-Forwarded-Encrypted: i=1; AJvYcCUSI63jdOlG7UITe+mOj0gh5wtfTi3EuGwlB3Xix3tcjGEzPQUxCkoqpw3dqbx6T4I7UVm3NiTEK+8+ugCTLLB6@lists.infradead.org
X-Gm-Message-State: AOJu0YzfCGnIlTee8DfRcAGXKrPaizEDOZzSPTkTLtFSkdu6ck2nDwjd
	7tB1bOxnONWgflkPiABgM8/6cGvag61tr4Kfac17dq1R/ngBj5vw2bDtfo5NYiKFIYM=
X-Gm-Gg: ASbGncvrPN/qxLC7Sy06GKNZJNO/FD8J3N+TZ+l7WR25uMAGUaYmW7OF0EoS5rWje3B
	nuZG2xq2kMOLH9NKX2IuI2PHXEdTBXMYNck0DUkALxOfmcOfYB54tDbcjBGHIkYXzh4191RvqGR
	7r37ufqSpLsbnWnLtV54/Q1pzNxHlXnyOM0n6qBP/RxEB4I+RY6+Jvs1xHFS0Gu72jKfedkuGRr
	jofSDtzPIUPkknOzYUstNUAFcNNFyTsFDSilgqznKCblKvP4ZgM0UmPfo6rSg9GNhY2Ji4v+s2y
	pt8z7VdFiIgE+L5X1YA5/AbP0Yian4jQFS4MxlHUPWIfz+S7ovzXhOxyLbuetu9TNIJ/rWgRonw
	j3dAioZHFsXd7wVn7gqxDg5Z6fIxmqHTxLPJN0/OpKGXDj04XcDVJHFygSbElTiX0qX15ywEwLW
	XYAYLQVhwV3bVRknEU
X-Google-Smtp-Source: AGHT+IEfTxQ47WU6csn7D7l8n715tzML3PIXrdRc13mLvEzqqwlnsoWOBOkiL4m2DTG8vCqweijuJQ==
X-Received: by 2002:a05:620a:404f:b0:8b2:6b9e:5383 with SMTP id af79cd13be357-8ba3b01fd56mr444216185a.85.1765382674256;
        Wed, 10 Dec 2025 08:04:34 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b62529f08asm1574658685a.11.2025.12.10.08.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 08:04:33 -0800 (PST)
Message-ID: <fd401d1b4f1e7b7178699227d31976453de5891e.camel@ndufresne.ca>
Subject: Re: [PATCH] media: platform: mtk-mdp3: add WQ_PERCPU to
 alloc_workqueue users
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, Frederic
 Weisbecker	 <frederic@kernel.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>,  Michal Hocko <mhocko@suse.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>
Date: Wed, 10 Dec 2025 11:04:32 -0500
In-Reply-To: <CAAofZF44pUoyDPnnv9UUuMkYvqiSWP4gELg4rutgo=3tNpBZsw@mail.gmail.com>
References: <20251107141303.223254-1-marco.crivellari@suse.com>
	 <7e24110636db36e8c0a877d90d2ed9570c4aecf5.camel@ndufresne.ca>
	 <CAAofZF44pUoyDPnnv9UUuMkYvqiSWP4gELg4rutgo=3tNpBZsw@mail.gmail.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-elCTUJq05jQZ+s6e+80U"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_080435_782055_896B76C9 
X-CRM114-Status: GOOD (  22.13  )
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


--=-elCTUJq05jQZ+s6e+80U
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 10 d=C3=A9cembre 2025 =C3=A0 16:30 +0100, Marco Crivellari a =
=C3=A9crit=C2=A0:
> On Tue, Dec 9, 2025 at 9:57=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresn=
e.ca> wrote:
> >=20
> > Hi,
> > I have to admit, there is likely no review here due to the lack of know=
ledge, so
> > in order to help educate myself (hopefully its not just me), can you ex=
plain why
> > the new default of WQ_UNBOUND would not be a fit for this driver ? Afte=
r all,
> > the author didn't care and didn't make a choice, so I feel like its wor=
th
> > asking.
>=20
> Hi Nicolas,
>=20
> The fact is that "alloc_workqueue()" without WQ_UNBOUND it means per-cpu.
> So what we are doing here is just make explicit that the workqueue is per=
-cpu.
>=20
> Currently there are no behavioral changes in alloc_workqueue(); in a
> future release
> WQ_UNBOUND will be removed and unbound will be the default. But as for no=
w,
> it is still per-cpu.
>=20
> We can of course change the current behavior and I can send the v2 with
> WQ_UNBOUND instead. Looking at the code there are not per-cpu variable an=
d
> the workqueue does not have the WQ_BH flag, so we can convert it if it
> is better.

thanks for clarifying. This driver having no clear maintainer, it is hard t=
o
delegate the checks needed, but from the description, it pretty much sounde=
d as
if most driver are picking up the wrong thing, because that is what the def=
ault
do.

I don't have strong opinion, if you think this driver can be ported in one =
step,
that is always my preference, and making things explicit is also nice. But =
I'm
also fine picking this as-is for now. Let me know, your preference, availab=
le
time and safety of not breaking anything is valid argument to me.

Nicolas

--=-elCTUJq05jQZ+s6e+80U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTmaEAAKCRDZQZRRKWBy
9EEeAQDs5xXNgxKj7E/WbnvR6sLKkzG6X122iEPvuj0dXihl0QEAhJoLXfaqlrU4
VxDFkGzm8D46bB6KVfJaGO3ukVUNUwQ=
=bgHX
-----END PGP SIGNATURE-----

--=-elCTUJq05jQZ+s6e+80U--

