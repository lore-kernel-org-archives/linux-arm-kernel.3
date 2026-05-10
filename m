Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD56BCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 22:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yrTTVXylGFrsJYsMh8CkWGl03wOBlEHIHNMw+NBNFo=; b=yf9UdS9vhUBnezCMIEu9qCe4U9
	KMxkv6FASg5cSHIUjLpJQNxA0qE9glrDhCQ9C8sicNn6acxJvGd+eO2LdOicy+pfiecBMN61nZXqH
	ahXGE+NgUxxx+pjBSIopK1Q9YdcgbXW82igyNzB3wIQjfSTdEboLN3yLltRmdkqklandAhpVRFRed
	xMXu1N3i/dgES/5h47ZE7vzF4eArc6NNfQ+gvEPrTj3woWn7adCEmEOG9txrM6419I0Jaag7IoRGF
	wYuYeFDH3JhgafCFKULb3pr3rA5vz52SIcyA2Lv6Nk/CcN6DRBhU9opL/X3OWIt7SZZ/Ydx9Nw9wf
	d7xMjpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMCKf-0000000BixK-0iJN;
	Sun, 10 May 2026 22:09:05 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMCKc-0000000Biwk-11s5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 22:09:03 +0000
Received: by mail-qv1-xf43.google.com with SMTP id 6a1803df08f44-8b8e98fd885so32462806d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 15:09:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778450941; cv=none;
        d=google.com; s=arc-20240605;
        b=brFbhwKuaxRe4cCFY/DmEeKEN6+XCn5xHLEo8j5VbQ9VngiR7w2XezgAo1xXU0D2Nk
         23G1JUYZxCqF8etXuOiiyxS9alf8pD7vfhSL1EPGsstuadXsD3IyiDIFAV7NgtqElp1b
         J1nTppa3+J3Sgbdq0FL2/LhWxRaQF/THgf+3+gEW2tfSRvnSvmGiZiOinKpfODcI2ghy
         PJpAtFWbQinPGWgfaiN/sB2EG5fviGQ7LgWtjJ3lQSdYR8S8lOh09Qfsj2yg+HBjUVpO
         XgFOTDohincy7rFKK6F+CFVytdjinyW5LXow6QOlq21i+PmPJNJKwcmUgvaBhzpkqLcn
         xY1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1yrTTVXylGFrsJYsMh8CkWGl03wOBlEHIHNMw+NBNFo=;
        fh=eN4VkAy+b0T7P+RqqnmFD6x/zqRv92pSYN0KFrOQB3s=;
        b=MG9ho4KzQjLeocQ2SZXxIJ7yWTLpX4T9cpv56k8FsNNMsnK9hYcB/qzo8y6GF/PK+X
         bUS2SSXOF7KE2jASx9G7qw6+kPKkbDYJplU1S08D9yWMXlPTDOyIlhPOopKIlmNXQCNE
         EGpqtw0F0wSSiy1h/oPw6SqzgNfhxhZfDyzrdb41BaBKwBqKFUlURzlv03qv4zwjmxff
         OKvdhrnF0qAvkn7k9SFMlabKa924ydqXgU3sWSCF12aggCEZ34XOV2lgPqQhUwYe0ksj
         C0nsZjStoIwq1z+X10Uaz5HFC8GNGEp7DFDuJEuqgZjoaB7UbsPDmFwhRNWtZxY/2+Zd
         cS8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778450941; x=1779055741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yrTTVXylGFrsJYsMh8CkWGl03wOBlEHIHNMw+NBNFo=;
        b=hwhxaEfftlBKSnw2DcVUbFdKpIr65o6HNjWt1gcs97q9cEU6ZsVNrWxiRmFePus3ma
         KReiRtdBp/68YiqiPHV2ZIchgiLWbDDcigOIUXtE7ORELjs99z8TSVSZjZTzx4wFpATg
         TQ7zejLfUo0cWy3LgYl9K7k0HNq9P9btEwbwE6nUuSZ1QBLn5jmrUkrhu5+90YqzLaiG
         wghm0y5kif7USHfnOSC/ZiGz59qWtO8mSeTzR054/Su1CoEaH2tUrJfPyXOltCftoPYl
         RBYtrlitDxkf0n1C0bsRmMcMnDyHkOdswUMsYPB/5IVjhKGg+H8PqLLy8kIIPT7/btUI
         LlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778450941; x=1779055741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1yrTTVXylGFrsJYsMh8CkWGl03wOBlEHIHNMw+NBNFo=;
        b=X7Bus3HsBwgnGAZfOQ2d0wC19Spo1Yp1Opcvs6rLUXqukXUm0E+83rCumXC7f2LlfB
         fhNeDly07YqFvRw/SOuyqyCZh8v7l/0VspWg3V4UMy5mLpM56HJQQm+K/pAJ8FY702qd
         fyx4SU88E1tG9npFTjF+PBSAd11whXB84O/vqO4HcFMpgrAJldY3SfuBSohwg9Se79IF
         Q1any53SUIPyZm65i6QmklAM4lAu2f0x4e2LrmoMNcANuw1uGW6leDI4SZpPpeUjNpRB
         wmr2xN+4QKlRgrTcIU/hL0qcD+fIVFU615DrOOoLGoFLvf8R7sKQDL86IEukpjNkVlm3
         b4CA==
X-Gm-Message-State: AOJu0YwXb2a4z5iiWKR/hp2LQ+bmtQnJR3GzGuz4LUDPZmaPzh6cyDmZ
	fM3e8pY1GRurJQkFuWPV/VGOaxa2KLx1v+g8q2/b1utuddt1pnHQ0z1u2zhGuNIOtWCjdQfNvH3
	PGfq+vCq6RU5/O4GkVF4PigMRl1/MRkA=
X-Gm-Gg: Acq92OGU5LExQiyS/4rhE18gXVWSSR9GrSx49VpNX8UfyaRg8iMiCKJnFbKrz1Rq+lJ
	fqzJiLfRvCGWoj7bN7ZmN9B8ZtTeIgOIXNOar6n3H9AUu9cKRxGZ2Equ8e5AKN0RiBn12/1HobQ
	psq+jkasaGEPyhDvDJvZw5w6SGnT5C05GoOBYwb5u3QEF5VjzXJKgn/mjofCJ9DzIJ4VvFF/YtG
	44tX3jrpcCVMSXQqyKfJenG1YZ9iLsiiPVHCV7hAoCQvsKoAoVtyyNzAnjIsJE55JRPR1pvoG32
	VT85BQRSRl18hUo7bZFEX1z+Im04s2PqAgo9ZV9/aKkHkUhtaq2pVpqcwD70UQIKxTtKmwgj2Sv
	f2Us=
X-Received: by 2002:a05:6214:3490:b0:8ac:ab13:8f0a with SMTP id
 6a1803df08f44-8bc42f53191mr314809106d6.11.1778450941019; Sun, 10 May 2026
 15:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260509214622.38319-1-enelsonmoore@gmail.com> <agCApXl_RwG3r2iu@sirena.co.uk>
In-Reply-To: <agCApXl_RwG3r2iu@sirena.co.uk>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sun, 10 May 2026 15:08:50 -0700
X-Gm-Features: AVHnY4JDFuVI4-B-XahTUiCLtqmXV0RUBZ4Lk39M_7mYtLJwiBRvGg4tyN_TPIM
Message-ID: <CADkSEUh99OCLYp3T4NUomQeTAQRe3ZzKTewD0SpNzD7a1LttEw@mail.gmail.com>
Subject: Re: [PATCH] sound: soc: fsl: eukrea-tlv320: update board checks to
 use the DT
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_150902_338535_BC00C609 
X-CRM114-Status: UNSURE (   7.88  )
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

Hi, Mark,

On Sun, May 10, 2026 at 5:57=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
> This renders the inclusion of asm/mach-types.h redundant.

Good point. I removed it in other drivers but missed it here, I'll
resend the patch with this fixed.

Ethan

