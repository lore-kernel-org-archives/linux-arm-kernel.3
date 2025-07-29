Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444F2C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 07:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VIsZznZv9An4JHHKZAQckY9P8VGPH88hhVv9GY2U48=; b=rqXodn7SYNOcfJFcmFF9LcyCS8
	eHR1OeHCb9NbG3e4zMvadNvqMMc10je5QKSPwAUILrbV2RuJG88v5M9WnmW3hghpHHYJlxswsVQPe
	EKeM4Iu+1RwqtgV9FUCvQcuvJDQxqCjzjt6hLeIcIGB6HdRYt2HkiXYsVFTo212qyYiTOz21RdQyU
	EJpfR4RKX81LACFRPhPKSN+2qvydEaFM0/irrayy7CJtO9iFQlK7CyNUqqFPLF64sRFMbtJUxiWpl
	IKUyNA8iXHui5UCk3/1Fpj6Edg6O9hGaFRLFaAvytpKgC1U9ACDzeWTK4AnfR+d3yZ5f9Hr0k8E/o
	QuqFzLDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugepK-0000000G7x6-2O4z;
	Tue, 29 Jul 2025 07:32:46 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugekJ-0000000G7R3-1fTi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 07:27:38 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A81F17A04DE;
	Tue, 29 Jul 2025 03:27:30 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 29 Jul 2025 03:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753774050;
	 x=1753860450; bh=+VIsZznZv9An4JHHKZAQckY9P8VGPH88hhVv9GY2U48=; b=
	b49751jPdhaSDK1DA5wbrq8EpKfeOODsQG75yNTPEruI9JBNR9IEnzYxxG+1EZ7Y
	heIdJEWx+91nYM2KFvJBPXKUX4IVjP63zhGPd/4Z0K/7wkrPjt86ja9SlXuv53Tg
	U3++93lb33OPGmPxU0y2HSh0+5i7lwZ86h3+fXOCdid5WjieQsmUt+TzL1ce8jaI
	74Qyh3ptmEmtdEAF6Pd4S0q706wZRPsMe3doirEWjjzJvAa3GW4jHjjakWIHlgYf
	cqz5cynzMjByaMO4HojuxyXXzhERHC/34cd+XTkYNoL7vKUPZOuXYJO9YLfdWKMP
	PezLVZXJSEqTlmGc9cpZCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1753774050; x=
	1753860450; bh=+VIsZznZv9An4JHHKZAQckY9P8VGPH88hhVv9GY2U48=; b=k
	svJM3uvEIXKN2x9YUTJnftLhPN/Uef66ooekbKPx/QGgw/+YKsG2/50mukuegeqN
	VpWtai3LAfWc7Xa2bX0vzat8u3z2J4ekjs7+Bf0kSrV6+RwOa6CNfaxqp5EH8XNV
	r26N3RionlzVggdoMQ1GpXQ2wnkWr9IJUkxGAfW4s2+A5hUJwm0tBeEG8jshs+gZ
	qtOB6K3JsUpQhViruAwhj4LJT45Iou/yYo+bg8x91B9dfK9SNuy2QDG3D69lNxFe
	jRC6cMFN6dGR4NN9LWDvFf0hzRHaeXOMDE/nHFMAozGmp8pCVVqmDxhIeSFTTBfc
	dp9F5XOh3jz3Gy4PkAT1w==
X-ME-Sender: <xms:4HeIaI7_Y8FtXIw8JAZYmwOKmPEU1zIMJ0JKC9lhNXZGsY4YShfGOQ>
    <xme:4HeIaJ5_CzINCPtFp7YdjWe7ZQAVElFWcKs8rE448HEeVh6u4ah0PvoQXcNh3FZKa
    Ddiuept6GmPjV6WnGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoh
    eprhhmkhdokhgvrhhnvghlsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohep
    ghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqrg
    hrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    ohepmhgrrhgvkhdrvhgrshhuthesmhgrihhlsghogidrohhrghdprhgtphhtthhopehlih
    grmhdrhhhofihlvghtthesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepkhhunhhinhho
    rhhirdhmohhrihhmohhtohdrghigsehrvghnvghsrghsrdgtohhm
X-ME-Proxy: <xmx:4XeIaMdHkpJjc81GGOHOK6QIfbW1dlFFnEoFBDzpnu8SQpmFNVIlVw>
    <xmx:4XeIaLIXxiVmL6nsur8348Rt6Fhd0txyfB823APjA7RLTbqW3OiMEw>
    <xmx:4XeIaJIgo7ec9U864y7_JHFzqwuEMGZji6CFm3jP80KdIQ9CjeQSbQ>
    <xmx:4XeIaKWYjorfQNixPLXNgPoqplt7eFOAJI4Qgjxi3Asx2NubXKcDVg>
    <xmx:4neIaJ23P4hX2ydLRgt2chrakWvQkkeBGZrh69cWEVRcQMF6iTJgDi8V>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E008B700068; Tue, 29 Jul 2025 03:27:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T9211a3247bb4ab7f
Date: Tue, 29 Jul 2025 09:27:08 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>
Cc: "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Russell King" <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 "Marek Vasut" <marek.vasut@mailbox.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Message-Id: <b80f879b-1f5b-4289-9cc3-075642d110ed@app.fastmail.com>
In-Reply-To: <CAMuHMdUbi7iRsXoYCwz_=Jt7ARGbeL-oG597swmsGODO8rLsqQ@mail.gmail.com>
References: <87freu5jxf.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdV=60U2n7iK1rCX=MecLw9M+afN8cap5GUL-apF49i-rw@mail.gmail.com>
 <877bzr97no.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdUbi7iRsXoYCwz_=Jt7ARGbeL-oG597swmsGODO8rLsqQ@mail.gmail.com>
Subject: Re: [issue report] ARM: compile error of frame size
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_002736_102124_36EB4732 
X-CRM114-Status: GOOD (  26.27  )
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

On Tue, Jul 29, 2025, at 09:15, Geert Uytterhoeven wrote:
> On Tue, 29 Jul 2025 at 02:12, Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
>> > >         > grep CONFIG_FRAME_WARN .config
>> > >         CONFIG_FRAME_WARN=3D2040
>> > >
>> > >         > git diff
>> > >         diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm=
/boot/compressed/Makefile
>> > >         index d61369b1eabe..c5173bd82380 100644
>> > >         --- a/arch/arm/boot/compressed/Makefile
>> > >         +++ b/arch/arm/boot/compressed/Makefile
>> > >         @@ -80,7 +80,7 @@ libfdt_objs :=3D fdt_rw.o fdt_ro.o fdt_=
wip.o fdt.o
>> > >
>> > >          ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
>> > >          CFLAGS_REMOVE_atags_to_fdt.o +=3D -Wframe-larger-than=3D=
${CONFIG_FRAME_WARN}
>> > > -        CFLAGS_atags_to_fdt.o +=3D -Wframe-larger-than=3D1280
>> > > +        CFLAGS_atags_to_fdt.o +=3D -Wframe-larger-than=3D2040
>> > >          OBJS   +=3D $(libfdt_objs) atags_to_fdt.o
>> > >          endif
>> > >          ifeq ($(CONFIG_USE_OF),y)
>> (snip)
>> > Yes it is.  And it is hard to fix, according to the maple_tree main=
tainer:
>>
>> Hmm...
>> Actually I have tried to same solution (=3D remove or fix the big nod=
e), but
>> noticed there are many such code. My suggested was very simple soluti=
on
>> I guess, but I'm not sure detail of ARM limitation, and/or it can sol=
ve all
>> cases, etc...
>>
>> But other CPU (like ARM64) doesn't have this issue, so we can follow =
same
>> way (=3D allow large frame) I guess.
>
> I do see it in one my arm64 builds, it depends on your kernel config:
>
>     lib/maple_tree.c: In function =E2=80=98mas_wr_spanning_store=E2=80=
=99:
>     lib/maple_tree.c:3812:1: warning: the frame size of 1040 bytes is
> larger than 1024 bytes [-Wframe-larger-than=3D] 3812 | }
>
> I guess Arnd has seen it in his randconfig builds, too...
>
>> Does ARM has some reason which can't use large frame ? If not, do you=
 think
>> we can allow to use it on ARM ?
>
> (stacked) Large frames may cause kernel stack overflow.

The version below works around the warning for arm, arm64 and x86
on both gcc and clang.

IIRC there are still warnings on riscv and powerpc with this, at
least with clang.

To some degree, adding 'noinline' ends up just hiding the actual
stack usage, as it just gets split between more functions. On the
other hand there are cases where the inlining also lets the compiler
run into some corner case where it ends up spilling extra variables
to the stack, especially with sanitizers enabled.

    Arnd

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index b4ee2d29d7a9..622300b49afc 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -3569,7 +3569,7 @@ static bool mas_wr_walk(struct ma_wr_state *wr_mas)
 	return true;
 }
=20
-static void mas_wr_walk_index(struct ma_wr_state *wr_mas)
+static noinline void mas_wr_walk_index(struct ma_wr_state *wr_mas)
 {
 	struct ma_state *mas =3D wr_mas->mas;
=20
@@ -3730,10 +3730,9 @@ static inline void mas_new_root(struct ma_state *=
mas, void *entry)
  * span.
  * @wr_mas: The maple write state
  */
-static noinline void mas_wr_spanning_store(struct ma_wr_state *wr_mas)
+static noinline_for_kasan void _mas_wr_spanning_store(struct ma_wr_stat=
e *wr_mas, struct maple_big_node *b_node)
 {
 	struct maple_subtree_state mast;
-	struct maple_big_node b_node;
 	struct ma_state *mas;
 	unsigned char height;
=20
@@ -3771,7 +3770,7 @@ static noinline void mas_wr_spanning_store(struct =
ma_wr_state *wr_mas)
 	 * store to ensure it's not NULL and to combine both the next node and
 	 * the node with the start together.
 	 */
-	r_mas =3D *mas;
+	memcpy(&r_mas, mas, sizeof(r_mas));
 	/* Avoid overflow, walk to next slot in the tree. */
 	if (r_mas.last + 1)
 		r_mas.last++;
@@ -3781,7 +3780,7 @@ static noinline void mas_wr_spanning_store(struct =
ma_wr_state *wr_mas)
 	r_mas.last =3D r_mas.index =3D mas->last;
=20
 	/* Set up left side. */
-	l_mas =3D *mas;
+	memcpy(&l_mas, mas, sizeof(l_mas));
 	mas_wr_walk_index(&l_wr_mas);
=20
 	if (!wr_mas->entry) {
@@ -3797,26 +3796,34 @@ static noinline void mas_wr_spanning_store(struc=
t ma_wr_state *wr_mas)
 		return mas_new_root(mas, wr_mas->entry);
 	}
=20
-	memset(&b_node, 0, sizeof(struct maple_big_node));
+	memset(b_node, 0, sizeof(struct maple_big_node));
 	/* Copy l_mas and store the value in b_node. */
-	mas_store_b_node(&l_wr_mas, &b_node, l_mas.end);
+	mas_store_b_node(&l_wr_mas, b_node, l_mas.end);
+
 	/* Copy r_mas into b_node if there is anything to copy. */
 	if (r_mas.max > r_mas.last)
 		mas_mab_cp(&r_mas, r_mas.offset, r_mas.end,
-			   &b_node, b_node.b_end + 1);
+			   b_node, b_node->b_end + 1);
 	else
-		b_node.b_end++;
+		b_node->b_end++;
=20
 	/* Stop spanning searches by searching for just index. */
 	l_mas.index =3D l_mas.last =3D mas->index;
=20
-	mast.bn =3D &b_node;
+	mast.bn =3D b_node;
 	mast.orig_l =3D &l_mas;
 	mast.orig_r =3D &r_mas;
+
 	/* Combine l_mas and r_mas and split them up evenly again. */
 	return mas_spanning_rebalance(mas, &mast, height + 1);
 }
=20
+static noinline void mas_wr_spanning_store(struct ma_wr_state *wr_mas)
+{
+	struct maple_big_node b_node;
+
+	_mas_wr_spanning_store(wr_mas, &b_node);
+}
 /*
  * mas_wr_node_store() - Attempt to store the value in a node
  * @wr_mas: The maple write state
@@ -4069,7 +4076,7 @@ static inline void mas_wr_append(struct ma_wr_stat=
e *wr_mas,
  *
  * This is where split, rebalance end up.
  */
-static void mas_wr_bnode(struct ma_wr_state *wr_mas)
+static noinline void mas_wr_bnode(struct ma_wr_state *wr_mas)
 {
 	struct maple_big_node b_node;
=20

