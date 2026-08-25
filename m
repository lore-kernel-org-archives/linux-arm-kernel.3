Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B38C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 21:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPWc7FkLme0xcnC1K2Lqk1CfpMV/JmaYPU5OWvErWdw=; b=VeaqePUIsM6VVIjBjAHHc7uKaZ
	Vhl/F9ZnYJrgr8DFJEcEqsFZZxtdUNdBgi+kNb7WKGbl70A5WL+NAVjMFA+qdDGQ6mAKvFgQqCnZM
	/TaG9NtNhLqXIHk8Wlq+lyJ8rvfWnGZ8NJPEzafYHH7W2NHQAgogf8bbDduN5pWSfvSfNO7tWHc3H
	pHB/nQl3pzah+RoFCcm2EH6pjUHV36VIi+R7JONLyj0sf7yz42dXNE93OD92Ygu0KE1hafj2kIKC6
	mMQvUleMp6N3EH2zRpxcRe4cpEh1WptX5cf2vqAnaN7/FNUzh2JD0rFjp1Bn4O4Zy+CDuP4rsW/w6
	V76PhiJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyz4X-00000001YvE-12is;
	Tue, 25 Aug 2026 21:52:45 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyz4T-00000001Yuq-43ry
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 21:52:43 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3a1f628b109so2200181fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 14:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787694759; cv=none;
        d=google.com; s=arc-20260327;
        b=rRWlYdmJ69zw3sJpCeb+A9mEbYdSCx8sPBPYVFahAR4m3C6i2BaHn05TFE/30bbWvN
         Nq8D5c2/5cPABk2FIF7YEXpTIF/xV2An4eiST+jq0+rzIxsUAt7Csejx3uMlQs+6iIlr
         BVUdApHgNGfKxvHsK7jHmLO5GNRf9vfYBe7dzsiVa0j1fvjT9js/jvr1mCMNJWz5mfWI
         uTTvDbeJNBLCl7evwsde3LdSYiPt4gpAf+JlpJ0vr6+3QmrU9O6PhWE4VthSwLPtRBKd
         Q8fto23feB0nUQh0k+RT1CVp7IPV6mixryenm/9XcKqxsVrpA8KoAm9W2s3pSRqYWbvW
         D4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cPWc7FkLme0xcnC1K2Lqk1CfpMV/JmaYPU5OWvErWdw=;
        fh=mXHhih+tN8J9sRoJ5jVveHeKuWy2tlW07vlsDUmWKF4=;
        b=nTxEOdBd5j9PrX7z27jRi883AuYL80kp1MOqxUOPeY/MH6W9lKWQiCEpgjFDlaVbLU
         19mDlYbk1TSDr/1oBJNgBnc3YpLg68NvHCzZ1+WlOmb1bQK7hHDmWME/aycgo5LAaz/Z
         DvjKPN6lpaIzRenlRMbzyyJsM1mSO33kgosxWoPhwX3bBORM1IgzswToJZM9CbqkwFN1
         2ZiBEgGvI++KmidyUPOKeQsPS1Oc84JapZ3yf74mw5QMFOl3IRlQvC48/VwhivMBmF0b
         y9bbnTN1ZOGjISURw7ewbWvNpbBvVHaHMMyRJA4/X5a1bQRyA/EAQhBFo9phXRmFg/vh
         8FCg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787694759; x=1788299559; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cPWc7FkLme0xcnC1K2Lqk1CfpMV/JmaYPU5OWvErWdw=;
        b=B3An1YpKClZId3gUvA4lPvZZM0PgL4770IW/7YpeydWT9EvwPC/7N+QORORD746Ec4
         aFWwgAsS/NM3eXGHsRjzZ8x2MbaGuiK4KMVtBXSOseNrSWmRwNwH4cVDNMwsWLXacphA
         aZiuYsei37QIyba4mWTZZ3+efX280qKUvvyBGu951ZPa4Nq5cnnpHn2QZjkM774BukJe
         h4m7UIJTwhWWy3MtNLyE5LU6121s8C2hYlVq58g2gI//+A2i+x6VIgfySEhU829Zfz4Z
         ggO5/+6N9y5LOV1/e6mE7NbIf36b7VguV6ggUZGRdGIbOkXEPVbCbeD0PavlZXVQ2RWM
         Vz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787694759; x=1788299559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPWc7FkLme0xcnC1K2Lqk1CfpMV/JmaYPU5OWvErWdw=;
        b=sM4LNV3kzVCejtmxOq3f6w9zrb+G2rGjSBaILCZfK8FNQR0ADepQzaxkYY5sYBjX/i
         u3ftaZWnX/WGAAkOnKpNIemA5tC4h0rrsAGwTKJWkkgxG9VslATqcaFMox6CVuqg7y5d
         vPv6cV+Jyv0EXJqODMOjtH7Sfj3flaKUZNjuejV5i5ZJ+GtKzfUcOTYGRVcYwUNjlcwV
         YK09HN3OVY7unq5uKX++/S22+vgaUmQh1brtpcTT908o1bGunE67yohB/M8S7vmTP8c5
         QzbcK42dRjwUy9Et+mQ+1xCWG8GcA4THguxzfELyPm7INbpOLRcaztH/CXX9rUuxjIKX
         dv1A==
X-Forwarded-Encrypted: i=1; AHgh+RqBlpR94FdFfLJkWZaPWGJN/NcbY2NYoyBS+Na2dtxT4Ugo73d/4CfZE1WAT8BXzjjeC8c5b7QhvgoiIpNHN4dR@lists.infradead.org
X-Gm-Message-State: AFuF++mDauURPv1ePen6qaPl3LVZ/rIKEYPKKFhDYrAxZ2+SdehXE2s8
	axHbSf62vngLDeGzwzoHt4cuqYLxbu0VUw0YkBYTGbGodLVDfInhuQBilCrVHkXL5EYdfWU5v+w
	Smi/TatYuSay4LZHhUqZ1IS0PlkMfztQ=
X-Gm-Gg: AR+sD11mgRje7O7P2z9d0gH5Lv5yvBnJOgQ/Jz42WQW3RAZ1yV0XhaFHjOQuvVQWQA4
	gwaIIdoWbgGXAbooOBdzg1rKHeDBhuQ7Q9JHfhmbyeW9IgFEulrQ2mnGQYeXi05+h4L6H0qXbdB
	0AzCUyhmdOpTXjy5ohmALNeR+dhoX4PH6AEugH6/6TLJCzNEc55N0lpZ2DHmsn24b41lE5AZzqS
	RRWmb0GINNaVV8XbcrStWbf9UHhn+a4K2UDW/hBUqChBmG2Omqx+usuxLpmKLPYyiMX+mjb4L49
	gGuUikutbfvzxd7/kWv1AXezbzdJreJn10fyFL/qVM3TIye71H8Qee7PexiNmqsjWOmWs84UzLV
	XFbzzzLVIoaLQiiLFsC9fpwV1G7D1Jv+Tlg==
X-Received: by 2002:a05:6512:145b:10b0:5ae:b260:cf47 with SMTP id
 2adb3069b0e04-5b4a900f79cmr285294e87.10.1787694758497; Tue, 25 Aug 2026
 14:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260825120812.2152-1-laurentiumihalcea111@gmail.com> <20260825120812.2152-3-laurentiumihalcea111@gmail.com>
In-Reply-To: <20260825120812.2152-3-laurentiumihalcea111@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 25 Aug 2026 18:52:26 -0300
X-Gm-Features: AcwNN1VZbn_T3F-FXzxO3As2xrvYIwwIKPf7ufPYVHOZJ70yk20HjiCElkvOxsw
Message-ID: <CAOMZO5B7Cn_qRq=_9ALXHx9svU8WQZbaaL_jXJorhux1L-JoPA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board support
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, elena.popa@nxp.com, cosmin.stoica@nxp.com, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_145242_034182_7A07BE1E 
X-CRM114-Status: GOOD (  13.69  )
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

Hi Laurentiu,

On Tue, Aug 25, 2026 at 9:11=E2=80=AFAM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add basic support for NXP's MR-NAVQ95 board. This board is designed for
> robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
> following hardware feats (list is not exhaustive):
>
> * based on i.MX95 19x19 SoC
> * 64GB eMMC
> * up to 16GB of LPDDR5 memory
> * 1 x USB 2.0 TypeC
> * 1 x USB 3.0 TypeC
> * 1 x RJ45 port with RTL8211 PHY
>
> The support targets revision B of the board.

Please add the bootph- properties as well.

Elena plans to support this board in U-Boot where they are needed.

For reference, here is a commit that adds the bootph- properties to
the frdm board:
https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/commit/?=
h=3Dimx/dt64-intend&id=3D50c0d934698f7602d579ba21262fcca3643c5464

