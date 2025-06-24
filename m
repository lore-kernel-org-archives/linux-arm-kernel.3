Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A88BC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9Hv1uTZX3yr514rv90DZ1Rmj6G2ElIhixYW3I7htvM=; b=wU4mtMjq7IlgTeZ/oIEMEA66fi
	jQjxUO8MXootvpg+eTDReK71klSY8k42dKatQa0B0qfs33bGxhIHWQWL0qBbXSFmpO/vU6cjFM+O2
	gjRcFZCRyKofjMsI+b6M9BOq0HWB0uEya/fqI1Q7f1lbcgP6efIUOj1zLghhP3Rh5qfYoKucMFuMu
	L/pRs6KQUdKwQPLF49MUF78rpAgR56BWp7UoRdqCF96P1YRmAwUuZs5/xUd3WuhF2rHweiJuLEmJ7
	JimRlEpjT5fOxsUMQAg+GN6EIlltr7Evozw16b9XaqEiXxFnFdSdJZlD0yeyVeDhyM7DAM1o+1Wnf
	r96JCaLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7KE-00000006NMR-0czR;
	Tue, 24 Jun 2025 17:20:50 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5BY-000000061h1-2KwB;
	Tue, 24 Jun 2025 15:03:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750777414; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QNhvekAmOyJlSaTPeOgdH1E2Ub4zERAV6edgOXXdI0FUdEpW7V/FCSUdBUnW6H6Puq5FmetNYBwHUNWM0Zs3H+3ExFeDFWsKbiSh/xoyDX/vKm2wf0GCkTF4wFVQDfXQDYeOMYkCrbz2vBVYuilte/Sm/cY8weRn6C3jDdQCXUA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750777414; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=C9Hv1uTZX3yr514rv90DZ1Rmj6G2ElIhixYW3I7htvM=; 
	b=eTcwFEa7cgN+sJI/MQaEVvj7GY/8WfHQnvRO2JLi4xtAnO1D3JxYrKSVtjLJfXxxl4LDFpTfzppV3hMaG9pw9E5WguludlhgLxIKODPZP9Sd55q7m2iWRlW7hTpGewYANIk3rsdwMgHD0plHMcqM8+HkrPAX+8AqJndn1CSimE0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750777414;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=C9Hv1uTZX3yr514rv90DZ1Rmj6G2ElIhixYW3I7htvM=;
	b=BGcojCJTmLwUDU/okdPTeoxUIln1VdOuHJw0JK+z3tpC8f5TzfqvTCYFeb0gxFgT
	4hURD370c1Ndko/lmXC0l0G0BCuyD1QjzmESRKGIEwiw0up6sZhKXfeUwzUeBFhWbN1
	l67b63G1lgJAFVeI5OjUXFyy/kNX7mdkFQ3J+cBs=
Received: by mx.zohomail.com with SMTPS id 1750777412568887.5168202530137;
	Tue, 24 Jun 2025 08:03:32 -0700 (PDT)
Message-ID: <60d033a5380674c3ad45d3245de63aacc5d73f73.camel@collabora.com>
Subject: Re: [PATCH v1 0/2] mfd: Add driver for multifunction MediaTek SPMI
 PMICs
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	lee@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  kernel@collabora.com
Date: Tue, 24 Jun 2025 11:03:30 -0400
In-Reply-To: <20250623120038.108891-1-angelogioacchino.delregno@collabora.com>
References: <20250623120038.108891-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_080344_650534_A47A9079 
X-CRM114-Status: UNSURE (   9.40  )
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

On Mon, 2025-06-23 at 14:00 +0200, AngeloGioacchino Del Regno wrote:
> Some MediaTek SPMI PMICs, like MT6363 and MT6373, are multi-function
> devices, as they have and expose multiple sub-devices; moreover, some
> of those also contain an interrupt controller, managing internal IPs
> interrupts: for those, a chained interrupt handler is registered,
> which
> parent is the SPMI controller itself.
>=20
> This series adds support for the MT6363, MT6373 SPMI PMICs and their
> interrupt controller.
>=20
> AngeloGioacchino Del Regno (2):
> =C2=A0 dt-bindings: mfd: Add binding for MediaTek MT6363 series SPMI PMIC
> =C2=A0 drivers: mfd: Add support for MediaTek SPMI PMICs and MT6363/73

For the whole series:

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

--=20
Thanks,

N=C3=ADcolas

