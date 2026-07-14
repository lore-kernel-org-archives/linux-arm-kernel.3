Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC31FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCojHCJqKCZD1pOeyWJ1gcjn0kakXpXScxWlytGoI3E=; b=UzL/lYPn4HdY6T1zUw9bV1TbRw
	vQUNeMIK7VjRwyaFjkTPyBvS37clcKn8PtwA3o5w/9t6t0Wu3cagkbvrOJC6FjsWbu4+eOSmgvmCj
	gimsuL7ydjl2t5Jb6tj6EL8DaNwwRe7P0pjQlMmARRczYcKHoKtQYINJx/a9lQ1pSHt3ywvQ8ls+b
	HpkgyJ86wPXSwTcLCAzYXTiPBUgTnXLldpIJGW/UA2ireaucF2LmoY/Y1boqRGMWf3lJkCBTxNaru
	FRNdMNppuBnn6pvgA1wY7J+F0k3bfzEPbtsUlHginmuN5i0huIn0PU5rEfV8sGoparDmdPuogYbxV
	xqCHRoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWl7-0000000B480-0s4I;
	Tue, 14 Jul 2026 06:36:49 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWl4-0000000B479-0Ibq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:36:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47db714766aso321520f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:36:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784011004; cv=none;
        d=google.com; s=arc-20260327;
        b=MOlblZ+qdI5HjBY4SNWpWXTz2oy3JuS9yqDAs7wCtNZnydUFKg1ZDqyB/YFaFCXxF2
         pHQbwDVECq8QI610lSXlwODbgS9d1iH107Z6GlSBNAX1WRd/d8Wdkz3lEW7+zUujs9Lc
         SVlHDZw+HWz/pfmyRqr4SZiMk7EkESwrlB4OUgFPTjlGtq77LIHeLh6OaAlCv3F08l/V
         vo8EMaQs47chuiatdTIMCF1pX8WyjpfFQiXdxpmf9VfHe4nAn7rHioE+IemUCj/TrgEZ
         5n3imyVn0yaY39CieHpZStN8bPUTh508WQzXvAq9Ajs/nilcNzwuZlRXGNCRzHiUgEN3
         MyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aCojHCJqKCZD1pOeyWJ1gcjn0kakXpXScxWlytGoI3E=;
        fh=/iuIiWMpBEFFwldh5HcaLUUGLP1A5zZtrgt8Ec9ruOc=;
        b=eWZ4rUMjn1RNBNDSHyF6y1Z7+LzOs45mLDW2uVU6x7gSMiBUfOsskcIDGlYj1bcHR1
         qPKk3Ko1gBJv9EEzU/NQIVAVsowfzTF0qOWN6PdFkOfRewEyhSQi0/l+dUrxYtHzrLAV
         1u/MLfezgUnBU98SLFdICtxu6nR8uV5Xt9Esi1TY9wzNWhxVJOKaP3yNtcx+af11mxPk
         uxrlLGzZ2/CsX0T4mUm9LZQgJCbc6IlTiReTpiLWfWxLI3WNgAi0jmEqrQCEWsDCcOeR
         n7Hg257fILDlAqu2WBTiiOvP4YvdWWrjGBkyqgiGHrjeVn34TfC4gtE64mRqwCw9jOI9
         biDQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784011004; x=1784615804; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aCojHCJqKCZD1pOeyWJ1gcjn0kakXpXScxWlytGoI3E=;
        b=bwTEywR368ECbbHS5nHT9vQ6QQYA31cLT1pfFtJ72GQhUDlsvcJwLkjlmO+VoZ5o2G
         MtMQltwFdXscEdgATZ15RGSzKdM2sJXgIBXl1LbWXmEXZRmn8HMAlFQ/Zu1nFqOhAfZm
         oATlUw5w9U55/R147L6302BV0k4vasA8G8RFjxRxmXoqLiIHLiPBOT7o+nvKpQddssFA
         h6pzzYTWZaaFqAgB6j/R1ydzxVDtRZr6eBJKeNXFNwhAXrHrkz9RFji1Z+fT7G5gNcmY
         26s8plwNYrfe3QuAPJBBZqi09Nh5ZGCnrbocEIRGfm/xjZyy2aFE3fJoAJn9uyiw3pa1
         l4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784011004; x=1784615804;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCojHCJqKCZD1pOeyWJ1gcjn0kakXpXScxWlytGoI3E=;
        b=APZx03z8QMZCwc8H/fWwePmbisv9hbr7M0oHI8lb4gI2aeK3R3NUl1LKN8O0xSAHDN
         3cdHYPVL7j4jcgsx2UTRjNO5IoyQXaOF+z+WoOw/guHpvqIDZGymm7KgL9bDquS27Elw
         e+YmvLxOF7UhtL1fodMPDOBme/VbCil3nP0kn6oYtIDIwMReB4Xb0kj9qGtFlCFCcc83
         28r9ILoJcGfLwkkUm7O7z/H0ElKazTqNQrekUU4Og44hUgM+TALUxnlSncxFMEl842Xs
         jm25SQSmkE4bVZ+J/A3dA3evAwlrOEI898K19i0lgwhgGtEeGsrizlqMaSaLKfuXflE0
         R0ig==
X-Forwarded-Encrypted: i=1; AHgh+Ro14DKhPa4ltNRsgFQ0XXKOHQoAizOfyDJBxQFXwh7HGDk0IDgFs+y91tTESy/ULQPi40EXIQlISbDgyfvPpkIm@lists.infradead.org
X-Gm-Message-State: AOJu0YzO0TRzKoo8/OADPCG1BPVvRHjfNXaVkOquOi2e1SgpmbbxqeyH
	F5d5kwFCSJxxAwlCvwQbm8kgKIdkvuAxcgFIgx7tAEMrnVwPQXDlorRauUKPXIdzlFqusDbJ3GX
	rvxBGYsnR2VDzbBi+hmhKNcrcO6WvZsc1ZwLP6DEybQ==
X-Gm-Gg: AfdE7ckcFZCuyCj/JgltBazk6fMAwwptn+8Z9IYzWalxmtUgKf0cO4IM5dGT+0/EzLQ
	pJtBSO6DwIy9glaRdpTsmCyulF38CM4HSlY1nHzBqr4EFd+mo5p+LV1lJmG/67uHeZ+qAe8lg4t
	au4I1jknX0YdFumVnuLY/r+7P0acjd6HJyvkXFJhJX9+W7BXwIF87X6SYNVF11NrjjIpA358VDV
	BGsLk2wUymqCruuavr9brFZQU/WDXBsExSGdFZkyymSU1EYaeKXvGMDUq8u0lsZ3HNCoB7YpT7P
	uypQH9wB8tq+ICuhzH8lcYv4JIR9SUalPPPJrCzSxN/8pyao9Avzbq1U5A==
X-Received: by 2002:a05:6000:250d:b0:473:fc10:f675 with SMTP id
 ffacd0b85a97d-47f2dcc0fe2mr11861531f8f.18.1784011003684; Mon, 13 Jul 2026
 23:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <28c6e7c493559feffc7e6231b0a2f0b73b7fda41.1783524645.git.gregoire.layet@9elements.com>
 <694c7c37-fb42-4994-93eb-04ed4ae299cf@lunn.ch> <f391981a-29f8-4ed3-b582-744aa47cbe1d@kernel.org>
In-Reply-To: <f391981a-29f8-4ed3-b582-744aa47cbe1d@kernel.org>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 14 Jul 2026 08:36:32 +0200
X-Gm-Features: AUfX_mw96YChou-o26GCAe3iXMgSxSuxMxN9BrrwvkqSMEY9o4uLAQRa2eH9JvU
Message-ID: <CAFi2wKboRtGWsDWvJjuWXpBQdKD+W4MjZdOdqerWEyWLZDvaaw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] serial: 8250_aspeed_vuart: add VUART over PCI
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, joel@jms.id.au, andrew@codeconstruct.com.au, 
	lkundrak@v3.sk, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_233646_129471_4BDAE8F8 
X-CRM114-Status: GOOD (  13.63  )
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

On Thu, 9 Jul 2026 at 07:19, Jiri Slaby <jirislaby@kernel.org> wrote:
>
> On 08. 07. 26, 18:46, Andrew Lunn wrote:
> >> +    if (silicon_revision_id =3D=3D AST2600A3_REVISION_ID)
> >> +            rc =3D regmap_update_bits(scu, ASPEED_SCUC24,
> >> +                                    ASPEED_SCUC24_PCIDEV1_INTX_MSI_HO=
ST2BMC_EN | ASPEED_SCUC24_MSI_ROUTING_MASK,
> >> +                                    ASPEED_SCUC24_PCIDEV1_INTX_MSI_HO=
ST2BMC_EN | ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1);
> >> +    else
> >> +            rc =3D regmap_update_bits(scu, ASPEED_SCUC24,
> >> +                                    /**
> >> +                                     * The bit 14 is reserved in the =
Datasheet.
> >> +                                     */
> >> +                                    ASPEED_SCUC24_PCIDEV1_INTX_MSI_SC=
U560_EN | BIT(14) | ASPEED_SCUC24_MSI_ROUTING_MASK,
> >> +                                    ASPEED_SCUC24_PCIDEV1_INTX_MSI_SC=
U560_EN | BIT(14) | ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1);
> >
> > checkpatch should be warning about these long lines. Traditionally,
> > the limit is 80 character lines, but recently 100 has been accepted by
> > some subsystems. The exception is when wrapping the lines will make
> > them less readable, but i don't think that applies here.
>
> FWIW 100 is fine by me. 80 is too ancient limit.

Modified to fit 100 characters-per-line limit.
No checkpatch warning.

Regards,
Gr=C3=A9goire

