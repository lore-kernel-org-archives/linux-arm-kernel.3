Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B05C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bDqMGYnVhsBZQ1sXpSP8J8dhP+q5GofYCfFvca8AcKE=; b=ibGrdhyiVRf5P+qVPQYxfgUOpI
	Y7AGbNiINFsDAvtDjCOyEy4JYQ0eIHVcyYPqEuyPpqaHFuhZuX/ChjBCG4O7KF0P5HN7S4nqa8hER
	CfihuO9yaVozyUEIYyRgv77vIaFaKsS7UfAqIzFknL/571efN3Db24HkmKdVkQ6+emOW8ldaMxQD7
	EVNSwMXyRu67DsZLb7rgcvv5hXEr6q0zVGtZy8+bwSkN4uLjivVa3fSuQpiUtZGtX9/5bER8cvAA6
	v6uJ+BeDaIspGpdTl5Xs9X38Maqpbsc4Aklqh15cJQ9PztHzHtac1HWhi2sRVNu/y37ys6t9I8xGF
	zzVHNn9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9If-0000000ELKi-1ASc;
	Mon, 29 Jun 2026 10:33:13 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9Ic-0000000ELJk-3H9s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:33:12 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-963a722ed59so175138241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:33:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782729189; cv=none;
        d=google.com; s=arc-20260327;
        b=hm9sqzNn7mB1+fATQnUZETWISHe2oJx+pQXz0R2ROaHOrkNPGociQ7XZ33i9Qlc0hR
         rsi7iAZuKlUUxVFN/ulpD+szy+6R+pwLdpkMLWAOcPiYUodaFEuxHw4tjRbjiVkGxJlx
         L+An4QLOsM7aGpiGqpOLqkgHduOe0yHJ6DrQLPSdWVAtZfx6YtMQe5ulXRJfwbhvHZCx
         AyI5kchU0/KJVriysT8up9MfaPOuE8CbnwLRvHEUS6v9nawxerHCs9WR2q/f396GPlhU
         Xav0OLzy8F1unWK1hROiz5fo1Eq8ZGHYOXDHBuYhRX87feX8NZhA54ZO+VS/HMDyyto0
         qdIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=bDqMGYnVhsBZQ1sXpSP8J8dhP+q5GofYCfFvca8AcKE=;
        fh=SPJIVDDOfLZzFGrUMyQY1mj87IjAu5YUW+vE7f+i7vs=;
        b=eNgLdukTCNcBwZAmJY1dbX6lHINq35pZa/w+BQOfea2H9lGIrUAZwjRzbET+DaT5v6
         3+Om/nklymOC0JEtg/FutiXbDPQyRBvkT1eNQ8cdi4i8FrFz71dQXghpYM8av+kgSKQg
         rabeDrbj9XQTCym4ENADj8zNFWqjgv/4GWJmB7BlF9GDI5sFK1Cn7otgtsptyBPSFMKo
         rlIUw+D9tBYiaQaeKjkZQFizBwAXECH7kcRoc+YKHMbt0bmItpJppIXReAvKVofKKqxo
         uQ7Dk0dVop3Elhn8BIRCwQT5h3/QBmlAYzpZzDADiVAI/ud8u8SA08CetASTWlYjMvzw
         /Nkw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782729189; x=1783333989; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bDqMGYnVhsBZQ1sXpSP8J8dhP+q5GofYCfFvca8AcKE=;
        b=eJIJ+1kvNnUzuTcQLrDB/d6QrrKdrfjT6Lna2OuldQvTH16CWglmAr3AGzIXHjyeg4
         gqc7UK/hBIfCWZ3k70irnYzZ/4ZZNG2wdVPCurFYAY4znofTlgS3Akqx7NAPde56oLou
         Mp6+OkwU3TGEnShA6HDPoq3ZM3ukDTe3PGQcInvq6mz8cWnFHBFHY90ZbpenFAFzX9J2
         QVg7/Fi+JHoK4eA4QvYGbzoIZujDB4h7BQbC2iBdse8M6R494MopOMHCsf6QD/gUaxAQ
         cpbohn43fsdnEBhJIzmHc9bXNViWDHQ7CCOq0smxdIKWvSU0WkC/xwEHBT6pnxvNxOyx
         5KoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729189; x=1783333989;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bDqMGYnVhsBZQ1sXpSP8J8dhP+q5GofYCfFvca8AcKE=;
        b=B37bdLQua6AyCLi5YV4CqxjU2gMw9z+1OmWRLOXtU+fh3+vDBBriIB6czYjoqDh9bO
         /ijQWL3ovzQ2pIOww2+7IdM+kSp557FMyXxpvpSXC50xZCGFne33j8XLj0C2IydPBvmq
         X32Lvs8ce4ozd3NAoXJTVTWezFbRbpV1Ev+WRbrUeQ/7Ks8B/Eu+QNsqtZ7coQRTIVTu
         FaH9SiMTw0sV9ahVTmQ1PyYD941LCcb3xNdZBU+s7Qfkq4nn4lMzAP9sDKeJQPGNKlH7
         gSpkUTSpcOHKLz94Hs9srwqNA07YOUgAO2GUUv21SmmIQe4c8OdRH75vZwI3ZiCF9HrT
         ejUw==
X-Forwarded-Encrypted: i=1; AHgh+Rqv0Qj9m4/Hv0b+GNNAwcMzXoOIrQUmijWjaItytcAIXxeLd4S30fDuBigsgAK0zD7aGT6NcbMqaOpzc2nslRHr@lists.infradead.org
X-Gm-Message-State: AOJu0YxYAPz72x0ZYu0pKYtwCESxDBTqE2Q9+EE8rFnuqNMlG8YRHaN7
	T+cBphvN//Q8lBdkoUkptiKowAADzQ6zQMd+udyqBrZUW89zvirtLDLWM+KLPdZxbr0KOEToMeR
	L6hPLYJKI+tPweDJknsOmlEUQB+h9kVw=
X-Gm-Gg: AfdE7clMQuspegSuLsZXcKlopM49wV4oTT0oT1eOSizWQyIMFIvKORzjJo2/Y8po8VX
	kSUMVQKkq3wnnvlVATbf2QoK4pIJDAzras2Gbj7StcMh0Wu37PSbLKKje2b7zKUw2IiIQzm/0kt
	GIhLU7F6hQEYwQtSwVc+MT23XD9IyY7lD4BoYWAQO9n9/FT/dBAR38olm2ayA2W67YNd2D8EfZt
	5O0XrGgUslp9vR0EkRVFh/iuzZnWgNjpuCORecLnRSci2GwZkqVUv0iU78Fgnp229j9W1rODuYe
	R5fftpjBYnf1QqX5vv1/C8SAilazIA==
X-Received: by 2002:a05:6102:c10:b0:739:18ea:565f with SMTP id
 ada2fe7eead31-73918ea5a95mr618398137.21.1782729189290; Mon, 29 Jun 2026
 03:33:09 -0700 (PDT)
MIME-Version: 1.0
From: Juan Manuel <juanmanuellopezcarrillo@gmail.com>
Date: Mon, 29 Jun 2026 12:32:58 +0200
X-Gm-Features: AVVi8Ce8OnbSifc50sa7-2oatyxo8iNF2oRrQajOiWvO-Ge81MADTdXhbhnWuCg
Message-ID: <CA+c=wxUU-mS=fiX2gCK_NH4SQPPWMqK6yrRSBSwvGZDEVaRkOA@mail.gmail.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: fix Li-Po overcharge on Powkiddy
 RGB10 Max 3 / X55
To: macromorgan@hotmail.com, heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000000f2dfe065561fca9"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_033310_869168_86578BCD 
X-CRM114-Status: GOOD (  26.79  )
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

--0000000000000f2dfe065561fca9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris, Heiko,

While bringing up a couple of Powkiddy RK3566 handhelds I ran into a
battery problem that turns out to be in the device trees, and it has
already cost me two packs, so I'd like to get it fixed for everyone.

Both battery nodes charge the cell above its own declared full voltage:

rk3566-powkiddy-rk2023.dtsi (inherited by the RGB10 Max 3):
constant-charge-voltage-max-microvolt =3D 4250000 (4.25 V), but
voltage-max-design-microvolt and the ocv-capacity-table-0 100% point
are both 4172000 (4.172 V).

rk3566-powkiddy-x55.dts: constant-charge-voltage-max-microvolt =3D
4300000 (4.30 V), but voltage-max-design-microvolt and the
ocv-capacity-table-0 100% point are both 4138000 (4.138 V).

So the charger drives each cell ~80=E2=80=93160 mV past its own OCV-100% po=
int
on every cycle. On a standard 4.2 V Li-Po that is an overcharge: it
raises the cell's internal resistance and kills the pack early. The
symptom is textbook =E2=80=94 the pack reads a normal voltage/SoC while on =
the
charger but collapses under load and shuts the device off the moment
it's unplugged. I lost two packs to this before tracing it to the DT;
capping the charge voltage at 4.2 V (verified at the rk817 CHRG_OUT
register) stopped the damage, and a third, already-degraded pack
stabilised.

Patch 1 also corrects the RGB10 Max 3 design capacity: it ships a 4000
mAh cell but inherits the 3151 mAh value from rk2023.dtsi. I did this
as a per-board override so I don't touch the shared profile, which may
well be correct for the RGB30 and other rk2023 users.

One thing worth a look on your side: the shared
rk3566-powkiddy-rk2023.dtsi default itself (4.25 V against a 4.172 V
OCV-100% point) looks like it would overcharge any device using it,
not just the RGB10 Max 3 =E2=80=94 but I only have the two units above to t=
est
on, so I've kept the fix scoped to what I can verify.

Thanks a lot for all the handheld DT work; none of these devices would
run mainline without it.

Juan Manuel Lopez Carrillo

--0000000000000f2dfe065561fca9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-arm64-dts-rockchip-powkiddy-rgb10max3-fix-battery-pr.patch"
Content-Disposition: attachment; 
	filename="0001-arm64-dts-rockchip-powkiddy-rgb10max3-fix-battery-pr.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mqz2w1d90>
X-Attachment-Id: f_mqz2w1d90

RnJvbSAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKdWFuIE1hbnVlbCBMb3BleiBDYXJyaWxsbyA8anVhbm1hbnVl
bGxvcGV6Y2FycmlsbG9AZ21haWwuY29tPgpEYXRlOiBTdW4sIDI5IEp1biAyMDI2IDEyOjAwOjAw
ICswMjAwClN1YmplY3Q6IFtQQVRDSCAxLzJdIGFybTY0OiBkdHM6IHJvY2tjaGlwOiBwb3draWRk
eS1yZ2IxMG1heDM6IGZpeCBiYXR0ZXJ5CiBwcm9maWxlCgpUaGUgUG93a2lkZHkgUkdCMTAgTWF4
IDMgc2hpcHMgd2l0aCBhIDQwMDAgbUFoIHBhY2ssIGJ1dCBpdCBpbmhlcml0cyBpdHMKYmF0dGVy
eSBub2RlIGZyb20gcmszNTY2LXBvd2tpZGR5LXJrMjAyMy5kdHNpLCB3aGljaCBkZXNjcmliZXMg
YSAzMTUxIG1BaApjZWxsIGFuZCwgbW9yZSBpbXBvcnRhbnRseSwgc2V0cyBjb25zdGFudC1jaGFy
Z2Utdm9sdGFnZS1tYXgtbWljcm92b2x0IHRvCjQyNTAwMDAgKDQuMjUgVikuCgpUaGF0IGNoYXJn
ZSB2b2x0YWdlIGlzIGFib3ZlIHRoaXMgcGFjaydzIGRlY2xhcmVkIGZ1bGwgdm9sdGFnZTogdGhl
CmluaGVyaXRlZCB2b2x0YWdlLW1heC1kZXNpZ24tbWljcm92b2x0IGFuZCB0aGUgb2N2LWNhcGFj
aXR5LXRhYmxlLTAgMTAwJQpwb2ludCBhcmUgYm90aCA0MTcyMDAwICg0LjE3MiBWKS4gVGhlIGNo
YXJnZXIgdGhlcmVmb3JlIGRyaXZlcyB0aGUgY2VsbAp+NzggbVYgcGFzdCBpdHMgb3duIGRlY2xh
cmVkICJmdWxsIiBvbiBldmVyeSBjeWNsZS4KCkZvciBhIHN0YW5kYXJkIDQuMiBWIExpLVBvIHRo
aXMgaXMgYW4gb3ZlcmNoYXJnZS4gSXQgcmFpc2VzIHRoZSBjZWxsJ3MKaW50ZXJuYWwgcmVzaXN0
YW5jZSBhbmQga2lsbHMgdGhlIHBhY2sgcHJlbWF0dXJlbHkuIFRoZSBmYWlsdXJlIG1vZGUgc2Vl
bgppbiB0aGUgZmllbGQgaXMgY2hhcmFjdGVyaXN0aWM6IHRoZSBwYWNrIHJlYWRzIGEgcGxhdXNp
YmxlIHZvbHRhZ2UvU29DCndoaWxlIG9uIHRoZSBjaGFyZ2VyIGJ1dCBjb2xsYXBzZXMgdW5kZXIg
bG9hZCAoYW5kIHNodXRzIHRoZSBkZXZpY2Ugb2ZmKQphcyBzb29uIGFzIGl0IGlzIHVucGx1Z2dl
ZC4gVHdvIHBhY2tzIHdlcmUgbG9zdCB0aGlzIHdheSBiZWZvcmUgdGhlIGNhdXNlCndhcyB0cmFj
ZWQgdG8gdGhlIERULgoKT3ZlcnJpZGUgdGhlIG5vZGUgZm9yIHRoaXMgYm9hcmQgd2l0aCB0aGUg
Y29ycmVjdCA0MDAwIG1BaCBkZXNpZ24gY2FwYWNpdHkKYW5kIGEgc2FmZSA0LjIgViBjaGFyZ2Ug
Y2VpbGluZywgYXQvYmVsb3cgdGhlIGNlbGwgZGVzaWduIG1heCBhbmQgdGhlCk9DVi0xMDAlIHBv
aW50LiBUaGUgY2hhcmdlIGN1cnJlbnQgbGltaXQgKDIgQSA9IDAuNUMpIGFuZCB0aGUgT0NWIGN1
cnZlCmFyZSBsZWZ0IHVuY2hhbmdlZC4KClNpZ25lZC1vZmYtYnk6IEp1YW4gTWFudWVsIExvcGV6
IENhcnJpbGxvIDxqdWFubWFudWVsbG9wZXpjYXJyaWxsb0BnbWFpbC5jb20+Ci0tLQogYXJjaC9h
cm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1NjYtcG93a2lkZHktcmdiMTBtYXgzLmR0cyB8IDUg
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU2Ni1wb3draWRkeS1yZ2IxMG1heDMuZHRzIGIv
YXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1NjYtcG93a2lkZHktcmdiMTBtYXgzLmR0
cwotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU2Ni1wb3draWRkeS1yZ2Ix
MG1heDMuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszNTY2LXBvd2tp
ZGR5LXJnYjEwbWF4My5kdHMKQEAgLTEyLDYgKzEyLDExIEBACiAJY29tcGF0aWJsZSA9ICJwb3dr
aWRkeSxyZ2IxMG1heDMiLCAicm9ja2NoaXAscmszNTY2IjsKIH07CgorJmJhdHRlcnkgeworCWNo
YXJnZS1mdWxsLWRlc2lnbi1taWNyb2FtcC1ob3VycyA9IDw0MDAwMDAwPjsKKwljb25zdGFudC1j
aGFyZ2Utdm9sdGFnZS1tYXgtbWljcm92b2x0ID0gPDQyMDAwMDA+OworfTsKKwogJmJsdWV0b290
aCB7CiAJY29tcGF0aWJsZSA9ICJyZWFsdGVrLHJ0bDg3MjNkcy1idCI7CiB9OwotLQoyLjQzLjAK
--0000000000000f2dfe065561fca9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-arm64-dts-rockchip-powkiddy-x55-cap-battery-charge-4.patch"
Content-Disposition: attachment; 
	filename="0002-arm64-dts-rockchip-powkiddy-x55-cap-battery-charge-4.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mqz2w1dh1>
X-Attachment-Id: f_mqz2w1dh1

RnJvbSAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKdWFuIE1hbnVlbCBMb3BleiBDYXJyaWxsbyA8anVhbm1hbnVl
bGxvcGV6Y2FycmlsbG9AZ21haWwuY29tPgpEYXRlOiBTdW4sIDI5IEp1biAyMDI2IDEyOjA1OjAw
ICswMjAwClN1YmplY3Q6IFtQQVRDSCAyLzJdIGFybTY0OiBkdHM6IHJvY2tjaGlwOiBwb3draWRk
eS14NTU6IGNhcCBiYXR0ZXJ5IGNoYXJnZQogdm9sdGFnZSBhdCA0LjJWCgpUaGUgeDU1IGJhdHRl
cnkgbm9kZSBzZXRzIGNvbnN0YW50LWNoYXJnZS12b2x0YWdlLW1heC1taWNyb3ZvbHQgdG8KNDMw
MDAwMCAoNC4zMCBWKSwgYnV0IHRoZSBzYW1lIG5vZGUgZGVjbGFyZXMgdm9sdGFnZS1tYXgtZGVz
aWduLW1pY3Jvdm9sdAphbmQgYW4gb2N2LWNhcGFjaXR5LXRhYmxlLTAgMTAwJSBwb2ludCBvZiA0
MTM4MDAwICg0LjEzOCBWKS4gVGhlIGNoYXJnZXIKdGhlcmVmb3JlIGRyaXZlcyB0aGUgcGFjayB+
MTYyIG1WIGFib3ZlIGl0cyBvd24gZGVjbGFyZWQgZnVsbCB2b2x0YWdlIG9uCmV2ZXJ5IGN5Y2xl
LgoKVGhpcyBvdmVyY2hhcmdlcyB0aGUgc3RhbmRhcmQgNC4yIFYgTGktUG8sIHJhaXNpbmcgaXRz
IGludGVybmFsIHJlc2lzdGFuY2UKYW5kIGtpbGxpbmcgaXQgZWFybHkgLSBpdCByZWFkcyBmaW5l
IG9uIHRoZSBjaGFyZ2VyIGJ1dCBjb2xsYXBzZXMgdW5kZXIKbG9hZCBvbmNlIHVucGx1Z2dlZC4g
Q2FwIHRoZSBjaGFyZ2Ugdm9sdGFnZSBhdCB0aGUgc3RhbmRhcmQsIHNhZmUgNC4yIFYuCkRlc2ln
biBjYXBhY2l0eSAoNDAwMCBtQWgpIGFuZCBjaGFyZ2UgY3VycmVudCAoMiBBKSBhcmUgYWxyZWFk
eSBjb3JyZWN0LgoKU2lnbmVkLW9mZi1ieTogSnVhbiBNYW51ZWwgTG9wZXogQ2FycmlsbG8gPGp1
YW5tYW51ZWxsb3BlemNhcnJpbGxvQGdtYWlsLmNvbT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRz
L3JvY2tjaGlwL3JrMzU2Ni1wb3draWRkeS14NTUuZHRzIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9yb2NrY2hpcC9yazM1NjYtcG93a2lkZHkteDU1LmR0cyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcm9ja2NoaXAvcmszNTY2LXBvd2tpZGR5LXg1NS5kdHMKLS0tIGEvYXJjaC9hcm02NC9i
b290L2R0cy9yb2NrY2hpcC9yazM1NjYtcG93a2lkZHkteDU1LmR0cworKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU2Ni1wb3draWRkeS14NTUuZHRzCkBAIC03Nyw3ICs3Nyw3
IEBACiAJCWNoYXJnZS1mdWxsLWRlc2lnbi1taWNyb2FtcC1ob3VycyA9IDw0MDAwMDAwPjsKIAkJ
Y2hhcmdlLXRlcm0tY3VycmVudC1taWNyb2FtcCA9IDwzMDAwMDA+OwogCQljb25zdGFudC1jaGFy
Z2UtY3VycmVudC1tYXgtbWljcm9hbXAgPSA8MjAwMDAwMD47Ci0JCWNvbnN0YW50LWNoYXJnZS12
b2x0YWdlLW1heC1taWNyb3ZvbHQgPSA8NDMwMDAwMD47CisJCWNvbnN0YW50LWNoYXJnZS12b2x0
YWdlLW1heC1taWNyb3ZvbHQgPSA8NDIwMDAwMD47CiAJCWZhY3RvcnktaW50ZXJuYWwtcmVzaXN0
YW5jZS1taWNyby1vaG1zID0gPDkxMDAwPjsKIAkJdm9sdGFnZS1tYXgtZGVzaWduLW1pY3Jvdm9s
dCA9IDw0MTM4MDAwPjsKIAkJdm9sdGFnZS1taW4tZGVzaWduLW1pY3Jvdm9sdCA9IDwzNDAwMDAw
PjsKLS0KMi40My4wCg==
--0000000000000f2dfe065561fca9--

