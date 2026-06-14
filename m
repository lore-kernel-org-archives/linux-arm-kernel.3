Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AE1CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 22:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Tu8HEOwDGsG2Hq2gF5ZhLKZeg2lUpEAdn6TcRtkruQ=; b=3TONGvxO2qsOkMYzVShDl3wCNT
	1X3V0Ns0z36E4kKmy3ZWrWjqfwZkc6g7jLKaYxPWppd43NsNu/R/DB7sXKyMPsT4zpcXyJ+kB0Mm8
	7RaymwYE6Lp1lCXy3cbRqhP/+fV+JLfXuTS1grRec70pwgvzW6gFWwErgc8Nslfu2jHsU7F4lePzG
	7a6q/i35MU2Y8duyC3OePujB0LK3Xi0NO1Zl+4Ka/pmk3qZ6ETMgWI1MajRKiAaPmztd1DhjdAyEy
	Z9k86udBmSCFZmRvzgY7lQFv4k3Gwb1A7nOw4cGwIwPo3iENtsKRgsyPdktCFmT/7pi/CToQ+23GD
	0/LaPhrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYtWJ-0000000DLD2-0HD1;
	Sun, 14 Jun 2026 22:41:35 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYtWG-0000000DLCh-1yRG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 22:41:34 +0000
Received: by mail-qv1-xf41.google.com with SMTP id 6a1803df08f44-8ced8f44da0so32255506d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 15:41:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781476890; cv=none;
        d=google.com; s=arc-20240605;
        b=CnXOeaSD4nyHo6Fc31UK/rrIr9AxU0Jq93MJT4yuXG3McCPWxLCgqMRu9OxLugL4TU
         /ZWkZ2GIWnIpfmSLcViVnFg57MHQB6pIRkWIYAyJNwh5DeDU3JSrc9tffCQEEVEXrn3i
         KwKJJ7703TEIKIJQiabDmN289HpoO1naUlv19LpnJA8rRQj6vjYWnT7QQ0kCvFD08t41
         W1fBa71I2OTEiYfxNPRBE2NfklAeC9DmE9OsPnOneS4jMAvPBYFJNKMSR/r7lVathfmM
         k9KCDnu3MRsW0n+ABNHnwPEwLKtr2EGfxcJpNf2UwdyighNriKbfnL78RrenTNyaunkX
         VIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Tu8HEOwDGsG2Hq2gF5ZhLKZeg2lUpEAdn6TcRtkruQ=;
        fh=JfJcOsIjyoTO8S2wo1z55+A69egsq+pCkpfaT+TDTfI=;
        b=OYjt8DVK3ffcmgTv3YvA5zo374pdBQa3VeYSvzyKwdthBxNLTW8mWjZZ9Jzl652lLO
         YWHebgXpVCj/Ysg78ExBJnKKDEiVfzfRvZEyhO5OugulJAI9oi8StRLm0qb32IaA4clO
         DUzvqAeKRJZLcTkFkz/Ndt16banmhxzat5/rSUE/9cgPvHdIDGks9A0yMZBjkNXzo/BR
         7c5ns9FjQdEX6WYEFK9JacfVRpIyFq66X5k9RbYR5NNfOX0XICZ7NanwUesbGvWSdlnf
         Om5hVndfkhchi5/ameAIzm0zzct6iioOyp9KvxRcCji4A9wrr/5dKa7sQeeLXw6Njo/u
         +GKQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781476890; x=1782081690; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Tu8HEOwDGsG2Hq2gF5ZhLKZeg2lUpEAdn6TcRtkruQ=;
        b=MEZkP1RBIophj2Y5f7QLdq0t3Z8BVuFJGJar84V3ActcZX3n/Gu8GefKU/E7SilNPE
         RWjQyXx/SWJ7KcWP3BKrw9Vcj9ozeXtA2oHjzYMlnB/LtSnn/46ZkfXxcduJEY5AjNNg
         so9QCXPla4POZzobgTp/xeMANCnefcQ2HbgIfAM2B1LSmvSZeRyPNg+gtov7urMcSSN2
         /kERS2CuqZEUdjmVYPAA1PGZH//n2otjilUmJCxjRSl9koOcxulQMSE+BblOa/dM7upY
         xerPMARItV32N2Slb9N0NV+2KBdtlCwWoPL8+jBbbAB+w1TKzwJEQW9zqmrfGRvOXnPN
         Tccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781476890; x=1782081690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Tu8HEOwDGsG2Hq2gF5ZhLKZeg2lUpEAdn6TcRtkruQ=;
        b=hdKkpg/Uzhz+d6hLyz7k37XoTXloZUKWbJFBKi4uL1lVKlEYiM+8X7AxGAh71RTVI6
         wpPjZlDdpKTwWN/K5MDs6UpPCChn0vO8bCvBOJ27M/K7CBfST07EPPzhe2r5w/KPE/Yy
         +CpYHXT7y1rOU1s5VU/PUKw/2xMv3RLl/d6GA30Kq7z70DP9jNixz3HM282m4AWlvjB2
         ozoImJiF2Au+R5ywm4r2AYa7UfykMGdyvfQaFugWZBdDr/95o+fraA05vp1R6XDTGUAP
         0TQ6BuP6vGpaZl8G0pBS3cchkv63hs2O9c9SGeSCJ4IIYFDt7qkcJ0y4twvQFujvYXV4
         75ug==
X-Forwarded-Encrypted: i=1; AFNElJ9wMepxWTAhujE6r/WZ7rC3yTCq8a3e5GzXihmGVJu+xRLDVAI/L8yYZgh8hvunOaVqfnL9CJ9apYzybMKTjI8G@lists.infradead.org
X-Gm-Message-State: AOJu0YzPz7Ld34eN5QaGVC0imLRhrFAUUSMnm05vYykmheDP7O5s5NO9
	EXI4TMXDk+qWI1LP1xSXLR/cRjJ/0G8O97xvTDRlb6116QUrK6pB+cggPxNhfoO0gm4LtMzREbf
	ckI8sudNfhXadp2W7X5/WGjPJh0QaLXUyoWil
X-Gm-Gg: Acq92OHWSrtNxHxtQELrmNhq1yhkRXuY8UXnS3M242+u8gfh5SZNljwu+FS2smEgXka
	ZM9GB3Nwp7rPyu4ruLTl+CXVBpmWhuclyeJ+TteCHajzcUsEBLsJtQmHPHhwfMy2rnaF5I6sUvk
	pmT+5p8BOAeXQzZCv69qGvE5z+jEcbIqR6963R71Jp1jWkyHR4Trd0aQyasvZX/CgXDebBQgt5Y
	nhmAdlF2pqYq09dq9dD7GQNmAgZTNCzzRJZDYjtobpiKliwDIPJJY1kS9nLGVqj4h/kWhn9Y6cS
	tSaZCVwL8IeYViFOA7WHLESkizZtY5XNWwwSJsRdN1/n6sDgZAXc84zQvlQ0yl3UDizraYlwHXP
	0V/E=
X-Received: by 2002:ad4:5ba5:0:b0:8ce:9cbd:b0ce with SMTP id
 6a1803df08f44-8d32e8e00a9mr187888716d6.34.1781476890554; Sun, 14 Jun 2026
 15:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260518014920.135011-1-enelsonmoore@gmail.com>
 <CAD++jL=0qYGoygUwGEXQL7C_ROnC7kfpRv8RA+H5tNWwYu+pQA@mail.gmail.com>
 <CADkSEUjsS8bOXDhgZ2EW40xifDZ-pk5y=YqyWT-+vQNd8JikUw@mail.gmail.com> <ai8nrc0ZUfPaqC_7@shell.armlinux.org.uk>
In-Reply-To: <ai8nrc0ZUfPaqC_7@shell.armlinux.org.uk>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sun, 14 Jun 2026 15:41:18 -0700
X-Gm-Features: AVVi8CeloLf3X89X-vuKdzus8DF70VSI7924-eHPEfeAfFNfJzWn8AlfAejHrA0
Message-ID: <CADkSEUhx_KDQ6LGEqEfGuB38HM-Xg45jYSUDcp6T_QLbS+ZWeA@mail.gmail.com>
Subject: Re: [PATCH] ARM: disable broken eBPF JIT on the Risc PC
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Thomas Weissschuh <thomas.weissschuh@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Shubham Bansal <illusionist.neo@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_154132_520830_B68C37DA 
X-CRM114-Status: GOOD (  15.01  )
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

Hi, Russell,

On Sun, Jun 14, 2026 at 3:14=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> > https://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=3D9477/=
1
>
> Should be s/arm\./arm/

Got it. Would it make sense to make the domain with the dot 301
redirect to the same URL at the one without the dot? Right now, Google
is indexing both, and this would remedy that.

> Also, you can use:
>
> Link: https://lore.kernel.org/all/CAD++jL=3D0qYGoygUwGEXQL7C_ROnC7kfpRv8R=
A+H5tNWwYu+pQA@mail.gmail.com/
>
> in the attributions in the commit message to indicate where more
> patch context can be found.

Thanks. I knew that but didn't think of it at the time I submitted.

> Lastly, too late for v7.1 as a fix, I already sent the pull request
> for that, sorry.

That's okay. It's not a particularly high priority :p

Ethan

