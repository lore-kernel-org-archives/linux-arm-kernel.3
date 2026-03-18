Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1B510854D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiHpCwGFAOs/wXB6PtDSepAcPps28mvRmd8j+A87AOk=; b=CXVdDnydZhqjHzlItnT76iNOKb
	PGbNLqNSe2+k9LV6fnk7NYstLBgHE5oIzpc2hkER7xkovJQvwHiQgVvWmKM7q5JMOxkM47/8KA5u/
	0Noj6H4r529SSty715BRBQZG/SMnW8qoL8UqitoF2z+6kwRPMBL35qS9uYae5Uhk8Qv/UFb9EQaNa
	Xg/rwcH9aKoIUT5eZApUBZsNVFxF5YXrqtQw9PRDLXRpU+2+zLFAHyxWtYvTxf9Ehaya3bCQgiKbl
	BlJPB8KzpJWyIoXd95J24DEvCmybdms4iP0i0wFDkQwt4Zuxjm4XSOoPpQU+lTeBY3ZNUZ8niIx2q
	BgMAAp8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mi5-000000085Xd-0E3S;
	Wed, 18 Mar 2026 08:57:01 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mi2-000000085WV-1lp5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 08:56:59 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b97d5b790cbso245110866b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 01:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773824215; cv=none;
        d=google.com; s=arc-20240605;
        b=I8fj7WfkvGXfjZzEMdIg8Ml1eUjkvWSK7qPsKwmVFxXme1x084CdxiU+Y7MPdZIRSm
         N57atR1uHsX8dXiFcoSn8Nsd7qCvD7iYpTSijZHzvUWNTfakXhi1+OSeUrnxNI0rY0/S
         XfenQoFq0b/4XANv2KDxpFMQngFtjvW6ogNhfwDeYTW7JoHUw6kK2Yw2jP7WJmC/kITp
         UzAYGz4oEnAD1zyql9tzBQalWwdUvvINNcUFMLjNrGlWA6cgve6Q8mxNRQ/VaIlHvIJJ
         trbL5S82gw7jWtTo4CjVqyk4dgm7N0YOUzKRBfTHJ6g3Wy4GbUWR+nOoVm54K9kn7Q41
         Fg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BiHpCwGFAOs/wXB6PtDSepAcPps28mvRmd8j+A87AOk=;
        fh=vCGASw2MyqiwMqVpOQYn1OpgJX+fnJmHCamADNB2cPE=;
        b=KM6jolZ3WUPPUWqR1JM7b8U6Il6o0aGECQD1TOynajv+hPLndY8SqcXaD1dhzCzqWX
         nv7MFRI4TcvpW1eYNUYfE8SMk4YWk8RUvZ2DBRSS38XT1vtPKsZb4jCqd73FNnTBD9sd
         x/tzNKqVffKLHDpYXT0+Vkb/+6K2DZ8SmNFl7W1fKw9DwM5lVhFI0iQArFCIZY5HbINX
         DjJsSCyGJ6vV+yTp1Tvt0cTaaIcmbjwh40fGkjbjhzzkcszwozD6PxxQqFcLPNQ3cCY+
         W979Uu0fYJmGN4W9/tn7KcEmIZWUhTey2PUuemT/hnEfLd3NWUMAdqRSErYQtVPWkKLO
         MmbA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773824215; x=1774429015; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiHpCwGFAOs/wXB6PtDSepAcPps28mvRmd8j+A87AOk=;
        b=ndAdmaPpEJe0XPMTxifMehoAFqcioOiOiglh4vJT8FPnFMK2npSyQ8ZbrxLKYFUoOx
         IEyyxvRX1RyC/KPrUEQqGoi+CAK5T4kjCiMw7kUXsV6OB69cuwx+/6nGAL33pJz9IIcI
         7Dw4bGPTrmlwuriWnkqk3YcuinSsd4nw9keeVYAcfPPdhajanj7Z3HgmYuxiiv8hsQ+s
         XN2D0y4puHeQM06X8A6843rR8dqdfs2H3jjXn97gC/MpRnUvCjG1AsApqbHOvsSoaNRM
         7XelAknIK6EJ5kRMKWUX8IyGgydnwb/CM3hpGQJmYLe2F8OAfvsxYD/BluC9a828qI7k
         lweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773824215; x=1774429015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BiHpCwGFAOs/wXB6PtDSepAcPps28mvRmd8j+A87AOk=;
        b=ZLlU3+PqwYJ3d3luUXvhhPB+q+fEdDAxanGrF3Y8r7cgF74fSPDLSFYx5uBeD1f0XE
         EtNBE2JGKrrB3taNnPiP8jcfbWFI+UBMgAIVqaroo08wMqCMYVgpGwOZDIJ8hWwjk+Ka
         VGYlQxBFG9xFKU/i5pXrIcymAuC7MMUgMdYF8osJjPYoYhYznB5HGyC3s4/pwfkCdZLx
         /j166V52+Ap4GbCFYdOQstJAvufuQ0VB0FmCHChBA7icIHKI09gg62dufZWKpQZoDC4Y
         lUaKUyTGc4RdOL4hj4vyLCM5H6+6sI7M0XnwgHqtcInZ6wGdEVvs9xBxd5dAHJplbBi6
         KaGA==
X-Forwarded-Encrypted: i=1; AJvYcCW3p29HEAwErQ0kylFsmWJXzO+cc2h1y0kjJEACul6rt6OqAs4u8OSe6TctwXutVx47qjTe5jTtHPcd3DOLhtVZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzagUG1VIho/MTPwh7o9BkhTcHrX5RZo0n/P9Op9lgqj0/xM/Z0
	vFBEsU6MESt4S5eo0dibcQWUkl3L9VdK+i+bT/lSRYCpWDK1xQAPuaO40W1wEFB/goP4kMwltCu
	NjgupPqL8L/RK8bvpJ1y2E+HuzpKy+PT0z0NTIajevQ==
X-Gm-Gg: ATEYQzzDN2/FrV0V9MKyRnpTpd5fUiXxvh8q95hWQf1sM44woNYgEAJqelw56qOpJGd
	5I7LF0uyWnTWAteE2EQNy+9IzgfRx8bRUOKMl2iT705yP1pb8dMgTnqatgaMRW7hxxqwp/XxcJj
	SzQw1U8dPD2TxEDHxWswC4xjjYbEFzooT07MdZXOF9Y6BGWu13zrOJjX5hVvIPf5ppwe5TDXK0R
	zy2xaZKc+sBMJAnWei3i/LKSQeP0UQE6GPhRUNr4HDDvZ7zbfayzw9k4HgF7agkunaz+3lPq3l1
	OzdKtQQS
X-Received: by 2002:a17:907:c02:b0:b96:edcd:cd04 with SMTP id
 a640c23a62f3a-b97f4b16f67mr130546366b.49.1773824215550; Wed, 18 Mar 2026
 01:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
 <20260317-husb311-v2-5-03c17c986abe@flipper.net> <20260318-able-goose-of-downpour-db3bbd@quoll>
 <d925c15d-add5-4f2a-8eac-fa7dd1b56bf2@kernel.org> <CAKTNdwH7RswOSBZyVKvsHfhZ3-xwyDs7ywOHuafMFb1-xNf0PA@mail.gmail.com>
 <c816a7b4-5237-4732-85af-26b70dce57f5@kernel.org>
In-Reply-To: <c816a7b4-5237-4732-85af-26b70dce57f5@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Mar 2026 12:56:40 +0400
X-Gm-Features: AaiRm51Z1zxcom6oGEe1zlWDtcLo4AbRjORqgQ25Zd5ty1p7g_jEjtaNn5KvnQ8
Message-ID: <CAKTNdwE-d5c9gzCxc0sXErc-M6TGdsf8M+ZZ0yoVAH9h_bqTkg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: rockchip: Add HUSB311 Type-C
 controller on RK3576 EVB1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gene Chen <gene_chen@richtek.com>, 
	Heiko Stuebner <heiko@sntech.de>, Yuanshen Cao <alex.caoys@gmail.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_015658_492674_7A509C8E 
X-CRM114-Status: GOOD (  24.22  )
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

On Wed, Mar 18, 2026 at 12:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 18/03/2026 09:30, Alexey Charkov wrote:
> > On Wed, Mar 18, 2026 at 12:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On 18/03/2026 09:17, Krzysztof Kozlowski wrote:
> >>> On Tue, Mar 17, 2026 at 10:08:02PM +0400, Alexey Charkov wrote:
> >>>> Rockchip RK3576 EVB1 board has a Hynetek HUSB311 USB Type-C controll=
er on
> >>>> its Type-C OTG port, which also supports DisplayPort Alternate Mode.
> >>>>
> >>>> Add the required DT nodes to enable basic HUSB311 operation.
> >>>>
> >>>> Note that for full support of mode and orientation switching, the US=
BDP
> >>>> PHY schema may need to be expanded, such as in [1]. This is left out=
 for
> >>>> now until the respective schema is finalized and merged.
> >>>>
> >>>> [1] https://lore.kernel.org/linux-rockchip/20260313-rockchip-usbdp-c=
leanup-v3-1-3e8fe89a35b5@collabora.com/
> >>>>
> >>>> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> >>>> ---
> >>>>  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 20 +++++++++++++=
+++++++
> >>>>  1 file changed, 20 insertions(+)
> >>>
> >>> DTS patch must not be in this patchset. Don't mix it.
> >>
> >> In case I am too vague: by don't mix it, I mean - separate DTS changes
> >> to independent patchset. They cannot be combined into USB posting.
> >
> > Thanks Krzysztof. I will split them out in the next submission. I
> > think it's important to first agree on the use of fallback compatibles
> > and the best way to handle the (already queued up in next) ET7304
> > patches this cycle before their bindings hit mainline. Then, I can
> > rebase and squash/split everything as required.
>
> These are independent problems. But if you want to connect them, then
> here you have:
> If I review the patch, Greg will take everything, defeating the purpose
> of my comment. So as you can see, I should rather not review them to
> achieve one of my goals.

I thought that having the DTS user with the binding that introduces
its existence helps the initial discussion. With the DTS change being
as minimal as it is here, it's definitely no biggie though.

I appreciate your guidance on the fact that Greg applies a series as a
whole. Will split up.

Best regards,
Alexey

