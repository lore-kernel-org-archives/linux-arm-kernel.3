Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03096C61CE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dV1SE9Rr4FAGI5Bf32y9009kK+o/lJvDK/L4CXx5CD8=; b=Mm8S4bxxoIrjCM9DQRbSIlKT2j
	H/OH4VgJ6uUn3j1E8ZMlBeQlLmDSzOn1odVVI8im0F46RvfyTSdIY7SgwmkMoS45TmsnRlrxnWAgc
	CvxFEZZfsTEYXJpF1sJNx1c5nXKeTYq6Z5ZRyL9ibUDbrKfhi642R+D0MtIL+UOaTdha1pzFogrpy
	9mWF9rvN/j1jqgguPqp7qJQgjFWu1RPAt9ADuRu5eParkhaRvYFQsFmtXTLaOFlgqEoio5WAD6Z2g
	iy40/fj2VrdZQSkX6hXrj8BO+y376V/z7wrfqjjtedCfBQ6ug7q3PEdJ8Yw4VDrWpPMhF29i703kG
	Meiky71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyoVW-00000000cAN-3ZIm;
	Tue, 25 Aug 2026 10:35:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyoVT-00000000c9Z-3cy1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 10:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1787654152; x=1819190152;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=zM+UWTmbccd041ge3CNoM7JhSXgFO5eDHpVidNkX8WA=;
  b=LUWpqUnpl5BkY9t52V5kovmaJi9d110yMZt7iTw/RZUXjUh5gGxBX7ko
   D7nt4//n9Q5EP2L1BTnmHB50WrGyNNoVGNvIv/ytUYSr+ELgyYUrAYtmY
   njh7fJXAyffatcJi1JccuExZIbf+0Y/jBRT8IieEGsg2Fl31A/y/B2yGm
   0C9MQa6cyd8TpPctPTzc9/Rnbi99Q5IBzS+Ge4FXlpEWABvXauqL3O1s4
   6e3mHqSeTIbgDUEjcyHWNhWmFs4og4jv0M+ZsvQmzOJ4tPcszrL8aU5ZQ
   Wp1izdgwJdilmczry05Wl6KSg+fBvfM04P9RuQWyB0CV+YEV0G0KDUWRJ
   g==;
X-CSE-ConnectionGUID: rxAGNm6IQ8eohggFuPa45A==
X-CSE-MsgGUID: pF6qGJetT+OCwW7ep9hU+Q==
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="62615109"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 03:35:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Tue, 25 Aug 2026 03:35:49 -0700
Received: from DEN-DL-M77643.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 25 Aug 2026 03:35:46 -0700
Message-ID: <daecc0252ffc5502391be729c11c3a663fe5030a.camel@microchip.com>
Subject: Re: [PATCH net-next v2 3/9] net: microchip: vcap: make vcap
 actionset decoding type_id aware
From: Jens Emil Schulz Ostergaard <jensemil.schulzostergaard@microchip.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: <horatiu.vultur@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<pabeni@redhat.com>, <daniel.machon@microchip.com>,
	<Steen.Hegelund@microchip.com>, <kees@kernel.org>, <gustavoars@kernel.org>,
	<robert.marko@sartura.hr>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-hardening@vger.kernel.org>
Date: Tue, 25 Aug 2026 12:35:46 +0200
In-Reply-To: <20260817211353.3633288-1-kuba@kernel.org>
References: <20260810-sparx5_l3_routing-v2-3-59e68cc8c8ca@microchip.com>
	 <20260817211353.3633288-1-kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_033551_913979_74462D1C 
X-CRM114-Status: GOOD (  20.87  )
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

On Mon, 2026-08-17 at 14:13 -0700, Jakub Kicinski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e content is safe
>=20
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: microchip: vcap: make vcap actionset decoding type_id aware
>=20
> This adds a helper, vcap_find_stream_type_id(), that pulls the type_id
> bits out of stream[0] just after the typegroup bits, and uses it in
> vcap_verify_actionstream_actionset() to compare the decoded type_id
> against info->type_id instead of always returning true.  The code change
> itself looks fine; the comment below is only about the commit message.
>=20
> > net: microchip: vcap: make vcap actionset decoding type_id aware
> >=20
> > When reading a rule back from hardware, decoding has to identify which
> > actionset the rule was written as. The existing logic was only aware of
> > the actionset subword length, which cannot distinguish actionsets that
> > share a subword length but differ in their type_id field. The LPM VCAP
> > added in a following patch introduces this case: ARP_PTR, L3MC_PTR and
> > ARP_ENTRY all occupy one subword and differ only by type_id.
>=20
> [Severity: Low]
> Should the sentence "The LPM VCAP added in a following patch introduces
> this case: ARP_PTR, L3MC_PTR and ARP_ENTRY all occupy one subword and
> differ only by type_id" be reworded?
>=20
> Two details don't seem to match the tree.  First, there is no L3MC_PTR
> symbol anywhere at this commit; grepping for L3MC under
> drivers/net/ethernet/microchip/ only matches the unrelated register name
> GA_ANA_L3_VLAN_ARP_L3MC_STICKY.  The one-subword LPM actionsets that do
> exist are just these two, in sparx5_vcap_ag_api.c:
>=20
> static const struct vcap_set lpm_actionfield_set[] =3D {
>         [VCAP_AFS_ARP_PTR] =3D {
>                 .type_id =3D 0,
>                 .sw_per_item =3D 1,
>                 .sw_cnt =3D 12,
>         },
>         [VCAP_AFS_ARP_ENTRY] =3D {
>                 .type_id =3D 2,
>                 .sw_per_item =3D 1,
>                 .sw_cnt =3D 12,
>         },
> };
>=20
> Second, the colliding actionset metadata is not added in a following
> patch; lpm_actionfield_set, lpm_actionfield_set_map and the
> sparx5_vcaps[VCAP_TYPE_LPM] entry that references them are already
> present at this commit, added by the preceding "net: microchip: vcap: add
> lpm vcap to autogen vcap api".  Only the sparx5/lan969x LPM driver
> enablement lands later.
>=20
> Could the message say the LPM actionset model is added by the preceding
> patch, and drop the L3MC_PTR reference?  The premise that two actionsets
> share sw_per_item =3D 1 and differ only in type_id does hold, so the chan=
ge
> itself still looks justified.

Yes I will update the message, and remove the stale remarks.

