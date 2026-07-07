Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CDBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 13:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TwL3+aqF7dc4/lpQ2JLA2uoetuIwHkPHzHxzge8914=; b=LaLAj8O9ptxpZcR4MzTXR5PZ1l
	LAWBZJEL6ZC7R7KX5LesDExTWbTHhprXHSr+4fmRpsjVOiWvNSp0hUVBFviCzckIEWjNdDkcIB7Ib
	NcYsTMox84dGI16bDAetWP/cVqW0G1i08nE5jSmKmLiUbprozkiSe2wfyjiGw0v5WQjD7QcR4oPlb
	+k5o9QL9N4eMvIyoA0cRViYlbrA9IRu0hAc+D6rWlT8Btn1nEynRqkNfHLW/ldbKNDuUSdOZUiMjk
	O6JBPfiNM94qLW8m6RV2Us2Cdud45yS1fSSSvJHieqb8PGJlSyACynuxA5ZhqAkIzjqVUnbwsJu+l
	VXmTWGVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh64Q-0000000F4tz-4AzX;
	Tue, 07 Jul 2026 13:42:43 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh64L-0000000F4tE-0ayW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 13:42:41 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-6651bc5730dso6628645d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 06:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783431756; cv=none;
        d=google.com; s=arc-20260327;
        b=OUJG6gKsQ62JN4mw5Ky8cfS6Cp5fwKbj/jyEVWpM5sIBvXjtSw8w7XA86DSmxT1PeD
         01dOPNY1LpGvdHiVBbFeqXC4C+HMCIAdl7l+s7kB19C1YBWbpUwdpjk5DOqjN3j/ugXx
         ZVsRRZP+fFE/4lpqOwNUm0mQHZ3QVaTL4N8rATUy0bC0eoje4h6AIYpi7o8u5mkNTFA2
         L9EaXJktuCFyTkP7tTleve4ERyS5K1ga13WI38Zs0WKKlb+s6Q/B51bvJZ5zRzJtJWDP
         rRtJkRNrxE96tpdqEVAgbzqsNGSw1aJI4S7uI7w1YctEj6vMm6AfzN83AVvnRSAsHb3l
         d8yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1TwL3+aqF7dc4/lpQ2JLA2uoetuIwHkPHzHxzge8914=;
        fh=3VnvDzcjo3RzuRvrGfWAw40615Abo/8PYlXluCmjpeQ=;
        b=cIupfthTrv3QhRAC6Q5ibgYir4EnJP5W6YbswOPOT0zPYfbplT9DNrmxoV3q1kuj+Z
         CN/FjYLhTmJcqaZAthOlEKIguYz0fOFjeOU5evXjI1+Lusu3qwV5W1pJ+As85zIed+d0
         oKAzNq9vmAeYpS1Eqz0ATE9icXwB0m3wYcW76C4mnxo/fvf9JgX8G+R9SJ4NrLQ4vG29
         rCYEV5PoM7Vu+pj5bUcHcQduVu+9iHlKhaGeYCyNXigPdnNjw5ElkJLbULC8MWaBiuz9
         Eb7MYN4vvk9nNU4d91KQqDs4CZOW35ZhIIGRck4vJx0DT64HJ7fMAs60k+5xabS1cWwt
         lqsg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783431756; x=1784036556; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TwL3+aqF7dc4/lpQ2JLA2uoetuIwHkPHzHxzge8914=;
        b=o9hdCQwfOSCLnA/Dm2Ct0YORNP9+8rIS3XRg6e94lzpeG9rbSTF+BQSUZrIkh+rRSO
         t/uXYIZWeV2XjQpPaLtdQ7q4dEahDmWeFHe4vRp/WB6j4wm7dw0vX2hWVuYvYFxSSZHC
         Qzpegq+SzZ56s82qEivtrk8Y5kpMGkhdoF33zer5ouYAFd2v9Eql1VUvgmnJ9jbJnuog
         ijwT5dVSreoZtjvc7xDPWXFQSd/XskS071rSWCWisaBKyCC5PfoNMVnPJ1TV4FiRtA3v
         ANfAFtFrB6paVM9wwIu8l81dqjisJNSrUQ8bcpvoAKHKGnXIFD4h1SIUJ82FzYr6WNj6
         pz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431756; x=1784036556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1TwL3+aqF7dc4/lpQ2JLA2uoetuIwHkPHzHxzge8914=;
        b=iIE4u39ajBHGMiq7GSvhHx9S+F4dt6gfJ9Ss68PEMHWXPQTaoz+pgpoSnGRJSyIIzl
         NzTP8+8qISTJ034oEQJ/e3P+ymdygsnx/3F5ZGhZ8lo+gxoF09oFVF7FVyBS+/cRMzyK
         E2AqyJuW87uhC02ShX/nphMAd1j9+1FSYQo8eIVUntcUffKcqiAbFCaL8EaEjojsEOju
         fhuNvuXX+NNR7H/SBUnUfTEWB49Ot9qqr77divjqVo+w3r6+xnFAGR03SORY7rjAIWUc
         SLMVRLO4BqMaqCMDHsJWUspq3vGei5r28ilbNUnXuZOxwNznRg+DtNK2OUHrUEP5sFrj
         tu1A==
X-Forwarded-Encrypted: i=1; AHgh+Rrd5MDhY93UviPd8ndudo9dWQvs20lc343bg7Nn2ssoNKw9daHbD3JERxuGl0/m0zo6dDYi7TRuEPKiF8IJ8KnV@lists.infradead.org
X-Gm-Message-State: AOJu0YxoSleN8r4a4qlyUzqBXPvRA/URcfep6FqetFVI9YfdHY3ET1VV
	ztZa64j2/UwMDAlsxnp6IAHxDvqUCh1JFYVKqmUzKz6NZWhcQ+YD31atN1rrKe+cs7CqIt6yfQd
	xqXAoHRMXGks2B28AS3HvccUjyx3VQ0o=
X-Gm-Gg: AfdE7cmIeTXwQFPvN5z46m47jlQMX6WnHz4RSGTrbcJRwSFazfaJnwPus6MmusljzhZ
	LTkyYNdgh5AzjZzIP9/4J6YdjWCoXQ/87sYC2y5lCv8H75XQcUJ1j3Out/5jBYLU5KDw0Pa5tZl
	iDWxJf5vq9noXpXQAh11AQxxTG/rH1ri/ssVwVD3C4p20eDOSxkKwfLVlQXfZPt/9hT3nEnMDjQ
	c+WHHJBiv5wuQtWWOwOBxnR4U2ObdiGRx5+HYiNA4imZymKFbcSXyZnY/gpIjyV36fjCAqCx0Hp
	d8XFFrQb/zfuXVTVal3DLGuftP8XURiJzvbW0wdY6O2LYCrv2ay+ffZGmt8ltf1hF/bJidyy
X-Received: by 2002:a05:690e:488c:20b0:664:d231:2f73 with SMTP id
 956f58d0204a3-6677fbd4331mr2922458d50.50.1783431755730; Tue, 07 Jul 2026
 06:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-5-506d936a1707@gmail.com> <e23e4581-7eee-4f4e-aa82-6b6bb6177678@cyberchaos.dev>
In-Reply-To: <e23e4581-7eee-4f4e-aa82-6b6bb6177678@cyberchaos.dev>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Tue, 7 Jul 2026 23:42:24 +1000
X-Gm-Features: AVVi8Cepx_g_efgo_16NLDYw5eSOtcfEnI_otyB3OoPCUn9_yzRFa4EgaystrR0
Message-ID: <CANpmGNtnZo20nPyM4qB7Jcty=bRFsxsDWnAOk9Md6Y+Rd9n7ZA@mail.gmail.com>
Subject: Re: [PATCH 05/10] mailbox: apple: Add DockChannel FIFO controller
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_064237_191691_85531BD0 
X-CRM114-Status: GOOD (  11.16  )
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

On Sun, Jul 5, 2026 at 6:14=E2=80=AFAM Yureka Lilian <yureka@cyberchaos.dev=
> wrote:
[...]
> > +             while (block) {
> > +                     writeb_relaxed(*p++, dc->data_base + DATA_TX8);
>
> This must be writel_relaxed, as writeb_relaxed in this mmio region will
> cause an SError. This is why we have separate addresses putting 8-bits
> and 32-bits into the FIFO I guess.
Ah, thanks for the pickup. Sorry for the silly typo from me, must have miss=
ed
it because all the HID writes are 4-byte aligned. Will correct in v2
which I should
be able to send out by the weekend unless I get busy.

Thanks again,
Michael

