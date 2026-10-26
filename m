Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6669606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2LEROP0d;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=M2hDB5jY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	To:Subject:Cc:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8Q+omKhqp0uDrTODd1TjyUX+NC/fBZ3CVo48Oxe1kOY=; b=2LEROP0dQCZ+g/gUxIoxyx0cl2
	BtcMAPCqlFGJsi8FTp96QXhIp3veQUxlMX5d4h3ikUjv6CLQNY8eKOOnZofqOEUvFXpH44jYSHW1g
	cVKUcgHeX2O0NxS6CM9uyf1yWZWt0g+9Pq8MMbfohtCAWnvBWI+kXA8uk8bJnuE6WgoH7eIxFQuPq
	I3fFuxbzO5sRQFGfLdgSBajqo2KsKTSc1gqWIhGkA4V3ng4RkvKFtku8F9Xhwm9mGsXIvCiHauML3
	a0TxIkB4L1gF7m7zeCFgcJdw0va8R+aG/kcIvjG5ErbiNs0sBHPDRY+8g0nzocfJH7d1xuNA43cT9
	L6lutevg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGgq-000000020yx-3suG;
	Mon, 26 Oct 2026 09:08:24 +0000
Received: from mail-m81152.xmail.ntesmail.com ([156.224.81.152])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGgn-000000020y1-3OY7;
	Mon, 26 Oct 2026 09:08:23 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 525bae744;
	Mon, 26 Oct 2026 17:08:17 +0800 (GMT+08:00)
Content-Type: multipart/mixed; boundary="------------0kbTt3PY7PtVP5ePh8Ay9wDO"
Message-ID: <4316c1da-f7ff-4fa5-a330-512800474e45@rock-chips.com>
Date: Mon, 26 Oct 2026 17:08:01 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Rob Herring <robh@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] PCI: rockchip-host: Retry training and hot-reset
 a JMB585 on RK3399
To: iav@iav.lv, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
References: <20261024-rockchip-pcie-resume-v1-0-58e54a5cf5f1@iav.lv>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261024-rockchip-pcie-resume-v1-0-58e54a5cf5f1@iav.lv>
X-HM-Tid: 0aa17777b9b703aakunm392e8e332fd77e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQx8YVk9JHxlPSUNJTUIaS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=M2hDB5jYzJG+5nuQv9QyH4DCKXm1JrkSy9iEp6XekBIjcWwlLc56n2GHbihU8hVeG8+ggBSUYZ+DAZlFEyOK1C/IYhK5fw7K3mOz1ADttlTb81JHm8/IdxnGsjUE8T1TxCzsC/Fbd3kKc0wJzeHeNdKo1/x7jZc0SZE6WeUbVvk=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=8Q+omKhqp0uDrTODd1TjyUX+NC/fBZ3CVo48Oxe1kOY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_020822_515109_EB06FD7A 
X-CRM114-Status: GOOD (  39.33  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is a multi-part message in MIME format.
--------------0kbTt3PY7PtVP5ePh8Ay9wDO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Igor,

在 2026/10/24 星期六 9:02, Igor Velkov via B4 Relay 写道:
> How should the host recover an endpoint that trains the link but does
> not answer config requests? On RK3399 that read ends in an external
> abort (an SError at probe, a synchronous abort on resume), and the
> kernel oopses instead of seeing an absent device.
> 
> This happens on a Kobol Helios64 (RK3399, JMicron JMB585 SATA) with
> v7.3-rc7 and the mainline DT, in two forms:
> 
> - link training times out on resume from s2idle (patch 1);
> - the link trains, but a config read of the JMB585 aborts in
>    pci_power_up() during resume, and during the bus scan at probe on
>    1 of 4 boots (patch 2).
> 
> Patch 1 trains again after a timeout. Patch 2 hot-resets the endpoint
> after training and waits the 100 ms required after a Conventional
> Reset, so every RK3399 probe and resume takes ~105 ms longer.
> 
> s2idle with both patches:
> 
>    sleep    patch 1 only    both patches
>    ~40 s    2 aborts / 30   0 / 100
>    ~25 s    1 abort / 11    0 / 40, then 2 aborts in the next 3
> 
> In the last of those aborts the link came back 25 ms after the hot
> reset instead of 2.8-2.9 ms, and the endpoint did not answer. We could
> not reproduce that state on demand.
> 
> host_init_port() already pulses PERST# and waits 100 ms before link
> training, so config reads start as soon as the link is up. Waiting 1 s
> after link-up before the bus scan did not help: 2 of 2 rebinds aborted,
> against 2 of 25 without the wait. That test ran without PERST# (the DT
> had no ep-gpios).
> 
> The data is from the code as posted, except that patch 2 now also fails
> probe and resume when the hot reset itself fails; that path was not hit.
> 
> Questions:
> 1. Is an unconditional hot reset after training acceptable, or should
>     it depend on the board?

Probably it depends on the board.

> 2. Can the host tell before a config read that the endpoint will not
>     answer?

The host cannot distinguish this case. If the endpoint has not prepared
to respond to a configuration read TLP, the controller should return all 
ones to the AXI bus instead of triggering a SError. Unfortunately, this 
is a limitation of the RK3399.

> 3. Is PERST# or a power cycle of the slot the expected recovery from a
>     slow link after the hot reset?

You've tried PERST# with the patch 1 applied. So perhaps it's doesn't
help.

> 4. Should the reset be a Secondary Bus Reset through the Root Port
>     rather than PCIE_CLIENT_HOT_RESET_CTRL? We did not try it.
> 

They are identical from the endpoint's point of view.

I've attached a vendor's debug patch, perhaps you could try it without
your patch.

> ---
> Igor Velkov (2):
>        PCI: rockchip-host: Retry link training that times out
>        PCI: rockchip-host: Hot-reset the endpoint before using the link
> 
>   drivers/pci/controller/pcie-rockchip-host.c | 88 ++++++++++++++++++++++++++++-
>   drivers/pci/controller/pcie-rockchip.h      |  4 ++
>   2 files changed, 89 insertions(+), 3 deletions(-)
> ---
> base-commit: 732c4f7d2c04f8c175d85d9243213783ee024ebc
> change-id: 20261018-rockchip-pcie-resume-2c4dfe23341e
> 
> Best regards,

--------------0kbTt3PY7PtVP5ePh8Ay9wDO
Content-Type: text/plain; charset=UTF-8;
 name="0001-arm64-pci-rockchip-Add-a-SError-handler-hook-for-the.patch"
Content-Disposition: attachment;
 filename*0="0001-arm64-pci-rockchip-Add-a-SError-handler-hook-for-the.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA5YjE0NTU5M2E1MTRkMGI1Y2Q0ZTcxMDEyOWQ2MGM1NGYyMzY4ZTJlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBTaGF3biBMaW4gPHNoYXduLmxpbkByb2NrLWNoaXBz
LmNvbT4KRGF0ZTogTW9uLCAyNiBPY3QgMjAyNiAxNjo1NTozMiArMDgwMApTdWJqZWN0OiBb
UEFUQ0hdIGFybTY0OiBwY2k6IHJvY2tjaGlwOiBBZGQgYSBTRXJyb3IgaGFuZGxlciBob29r
IGZvciB0aGUgUENJZQogaG9zdAoKU29tZSBSSzMzOTkgYm9hcmRzIHdpdGggYSBQQ0llIHN3
aXRjaCBiZWhpbmQgdGhlIFJvY2tjaGlwIGhvc3QKY29udHJvbGxlciBzZWUgYSBjb25maWcg
cmVhZCBlbmQgaW4gYSBzeW5jaHJvbm91cyBleHRlcm5hbCBhYm9ydCwgd2hpY2gKZG9fc2Vy
cm9yKCkgdHJlYXRzIGFzIGZhdGFsIGFuZCBwYW5pY3MgdGhlIGtlcm5lbC4KCkFsbG93IGEg
cGxhdGZvcm0gZHJpdmVyIHRvIGluc3RhbGwgYSBoYW5kbGVyIGZvciBTRXJyb3IuIFRoZSBo
YW5kbGVyCnJ1bnMgYmVmb3JlIHRoZSBkZWZhdWx0IGhhbmRsaW5nIGFuZCwgd2hlbiBpdCBy
ZXR1cm5zIDAsIHRoZSBlcnJvciBpcwpjb25zaWRlcmVkIGhhbmRsZWQgYW5kIHRoZSBrZXJu
ZWwga2VlcHMgcnVubmluZy4gR2l2ZSBpdCB0aGUgZmF1bHRpbmcKYWRkcmVzcyBmcm9tIEZB
Ul9FTDEgYW5kIHRoZSBFU1IgdmFsdWUsIHNvIHRoZSBoYW5kbGVyIGNhbiBkZWNpZGUKd2hl
dGhlciB0aGUgZXJyb3IgYmVsb25ncyB0byBpdHMgZGV2aWNlLgoKVGhlIFJvY2tjaGlwIFBD
SWUgaG9zdCBkcml2ZXIgcmVnaXN0ZXJzIHN1Y2ggYSBoYW5kbGVyIG9uY2UgdGhlIGxpbmsg
aXMKdXAgYW5kIGp1c3QgbG9ncyB0aGUgYWRkcmVzcyBhbmQgRVNSIGZvciBub3cuCgpTaWdu
ZWQtb2ZmLWJ5OiBTaGF3biBMaW4gPHNoYXduLmxpbkByb2NrLWNoaXBzLmNvbT4KLS0tCiBh
cmNoL2FybTY0L2luY2x1ZGUvYXNtL3N5c3RlbV9taXNjLmggICAgICAgIHwgIDMgKysrCiBh
cmNoL2FybTY0L2tlcm5lbC90cmFwcy5jICAgICAgICAgICAgICAgICAgIHwgMTggKysrKysr
KysrKysrKysrKysrCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtcm9ja2NoaXAtaG9z
dC5jIHwgMTcgKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNp
ZS1yb2NrY2hpcC5oICAgICAgfCAgNSArKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9zeXN0ZW1f
bWlzYy5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9zeXN0ZW1fbWlzYy5oCmluZGV4IGQz
MTZhODA0ZWIzOC4uMjk5ODM5ZjUxN2ViIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2luY2x1
ZGUvYXNtL3N5c3RlbV9taXNjLmgKKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9zeXN0
ZW1fbWlzYy5oCkBAIC0yNSw2ICsyNSw5IEBAIHZvaWQgYXJtNjRfbm90aWZ5X2RpZShjb25z
dCBjaGFyICpzdHIsIHN0cnVjdCBwdF9yZWdzICpyZWdzLAogCQkgICAgICBpbnQgc2lnbm8s
IGludCBzaWNvZGUsIHVuc2lnbmVkIGxvbmcgZmFyLAogCQkgICAgICB1bnNpZ25lZCBsb25n
IGVycik7CiAKK3ZvaWQgKmhvb2tfc2Vycm9yX2hhbmRsZXIoaW50ICgqZm4pKHVuc2lnbmVk
IGxvbmcsIHVuc2lnbmVkIGxvbmcsCisJCQkJICAgIHN0cnVjdCBwdF9yZWdzICopKTsKKwog
c3RydWN0IG1tX3N0cnVjdDsKIGV4dGVybiB2b2lkIF9fc2hvd19yZWdzKHN0cnVjdCBwdF9y
ZWdzICopOwogCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC90cmFwcy5jIGIvYXJj
aC9hcm02NC9rZXJuZWwvdHJhcHMuYwppbmRleCBkNjM5MWFiMjBkYjMuLmQ4N2JkMWJkMGVl
OCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvdHJhcHMuYworKysgYi9hcmNoL2Fy
bTY0L2tlcm5lbC90cmFwcy5jCkBAIC05NDYsNiArOTQ2LDkgQEAgdm9pZCBfX25vcmV0dXJu
IGFybTY0X3NlcnJvcl9wYW5pYyhzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9u
ZyBlc3IpCiAJY3B1X3BhcmtfbG9vcCgpOwogfQogCitzdGF0aWMgaW50ICgqc2Vycm9yX2hh
bmRsZXIpKHVuc2lnbmVkIGxvbmcsIHVuc2lnbmVkIGxvbmcsCisJCQkgICAgIHN0cnVjdCBw
dF9yZWdzICopIF9fcm9fYWZ0ZXJfaW5pdDsKKwogYm9vbCBhcm02NF9pc19mYXRhbF9yYXNf
c2Vycm9yKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25nIGVzcikKIHsKIAl1
bnNpZ25lZCBsb25nIGFldCA9IGFybTY0X3Jhc19zZXJyb3JfZ2V0X3NldmVyaXR5KGVzcik7
CkBAIC05ODAsMTEgKzk4MywyNiBAQCBib29sIGFybTY0X2lzX2ZhdGFsX3Jhc19zZXJyb3Io
c3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgZXNyKQogCiB2b2lkIGRvX3Nl
cnJvcihzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBlc3IpCiB7CisJdW5z
aWduZWQgbG9uZyBhZGRyID0gcmVhZF9zeXNyZWcoZmFyX2VsMSk7CisKKwlpZiAoc2Vycm9y
X2hhbmRsZXIgJiYgIXNlcnJvcl9oYW5kbGVyKGFkZHIsIGVzciwgcmVncykpCisJCXJldHVy
bjsKKwogCS8qIG5vbi1SQVMgZXJyb3JzIGFyZSBub3QgY29udGFpbmFibGUgKi8KIAlpZiAo
IWFybTY0X2lzX3Jhc19zZXJyb3IoZXNyKSB8fCBhcm02NF9pc19mYXRhbF9yYXNfc2Vycm9y
KHJlZ3MsIGVzcikpCiAJCWFybTY0X3NlcnJvcl9wYW5pYyhyZWdzLCBlc3IpOwogfQogCit2
b2lkICpob29rX3NlcnJvcl9oYW5kbGVyKGludCAoKmZuKSh1bnNpZ25lZCBsb25nLCB1bnNp
Z25lZCBsb25nLAorCQkJCSAgICBzdHJ1Y3QgcHRfcmVncyAqKSkKK3sKKwl2b2lkICpyZXQg
PSBzZXJyb3JfaGFuZGxlcjsKKworCXNlcnJvcl9oYW5kbGVyID0gZm47CisKKwlyZXR1cm4g
cmV0OworfQorCiAvKiBHRU5FUklDX0JVRyB0cmFwcyAqLwogI2lmZGVmIENPTkZJR19HRU5F
UklDX0JVRwogaW50IGlzX3ZhbGlkX2J1Z2FkZHIodW5zaWduZWQgbG9uZyBhZGRyKQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJvY2tjaGlwLWhvc3QuYyBi
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1yb2NrY2hpcC1ob3N0LmMKaW5kZXggNWIw
NzFiZGM0ZjkwLi40NjQwYWRlZTEyN2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvcGNpZS1yb2NrY2hpcC1ob3N0LmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxl
ci9wY2llLXJvY2tjaGlwLWhvc3QuYwpAQCAtOTA0LDYgKzkwNCwxOSBAQCBzdGF0aWMgaW50
IHJvY2tjaGlwX3BjaWVfcmVzdW1lX25vaXJxKHN0cnVjdCBkZXZpY2UgKmRldikKIAlyZXR1
cm4gZXJyOwogfQogCisjaWZkZWYgQ09ORklHX0FSTTY0CitzdGF0aWMgaW50ICgqc2Vycm9y
X2NoYWluKSh1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgZXNyLAorCQkJICAg
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpOworCitzdGF0aWMgaW50IGRvX3JvY2tjaGlwX3BjaWVf
c2Vycm9yKHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBlc3IsCisJCQkJICAg
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCit7CisJcHJfaW5mbygicm9ja2NoaXAtcGNpZTogU0Vy
cm9yIGhhbmRsZWQsIGFkZHIgJSNseCBlc3IgJSNseFxuIiwKKwkJYWRkciwgZXNyKTsKKwly
ZXR1cm4gMDsKK30KKyNlbmRpZgorCiBzdGF0aWMgaW50IHJvY2tjaGlwX3BjaWVfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgcm9ja2NoaXBfcGNp
ZSAqcm9ja2NoaXA7CkBAIC05NjksNiArOTgyLDEwIEBAIHN0YXRpYyBpbnQgcm9ja2NoaXBf
cGNpZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWlmIChlcnIgPCAw
KQogCQlnb3RvIGVycl9yZW1vdmVfaXJxX2RvbWFpbjsKIAorI2lmZGVmIENPTkZJR19BUk02
NAorCXNlcnJvcl9jaGFpbiA9IGhvb2tfc2Vycm9yX2hhbmRsZXIoZG9fcm9ja2NoaXBfcGNp
ZV9zZXJyb3IpOworI2VuZGlmCisKIAlyZXR1cm4gMDsKIAogZXJyX3JlbW92ZV9pcnFfZG9t
YWluOgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJvY2tjaGlw
LmggYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtcm9ja2NoaXAuaAppbmRleCBiNWRh
MTU2MDFiNTguLjI5MWJlZmNkZjZjMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJv
bGxlci9wY2llLXJvY2tjaGlwLmgKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ll
LXJvY2tjaGlwLmgKQEAgLTE4LDYgKzE4LDExIEBACiAjaW5jbHVkZSA8bGludXgvcGNpLWVj
YW0uaD4KICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgogCisjaWZkZWYgQ09ORklHX0FSTTY0
CisjaW5jbHVkZSA8YXNtL3NpZ25hbC5oPgorI2luY2x1ZGUgPGFzbS9zeXN0ZW1fbWlzYy5o
PgorI2VuZGlmCisKIC8qCiAgKiBUaGUgdXBwZXIgMTYgYml0cyBvZiBQQ0lFX0NMSUVOVF9D
T05GSUcgYXJlIGEgd3JpdGUgbWFzayBmb3IgdGhlIGxvd2VyIDE2CiAgKiBiaXRzLiAgVGhp
cyBhbGxvd3MgYXRvbWljIHVwZGF0ZXMgb2YgdGhlIHJlZ2lzdGVyIHdpdGhvdXQgbG9ja2lu
Zy4KLS0gCjIuMjUuMQoK

--------------0kbTt3PY7PtVP5ePh8Ay9wDO--

