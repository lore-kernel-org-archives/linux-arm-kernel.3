Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304A3E77194
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 18:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rx/BAtYz+YSmLVs6o5kW+gu0D5xRt+OIkNVnblY2Dys=; b=HHbFMLbElrebi89T9Nzz/QDWY1
	K4xCC9sya6aIH8JhR6fViZjrTdLssbZ74kMmvdDDW8Shg/n4TcyZA2x5iwMB3ImTiX8iyiQ3m4/9k
	l4LrXHZKm9BEHzN5tM0LcqlULugHau04wwWuukRv0Pl2dE3dFI+jA9OmGg7tQP6rozB3TxxR8whwH
	NvMXXv2VcK8kVlZQ9WCUyS7aByRG3pUZf7a3bjrlRpaHLbF7o8vVRbk+gBf7D6+weVVe2knPKS4On
	BlS9mSPnLqzKWqB46GEGkumOBMzFhxylWUTZwbDxSBPzZezUR2c7cQ9aGX9gifum8ZLod6ezyNQot
	6yjLOqKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tShFT-00000007c4a-080R;
	Tue, 31 Dec 2024 18:45:47 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tShEG-00000007bxI-2KkC;
	Tue, 31 Dec 2024 18:44:33 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21649a7bcdcso133612465ad.1;
        Tue, 31 Dec 2024 10:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735670671; x=1736275471; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rx/BAtYz+YSmLVs6o5kW+gu0D5xRt+OIkNVnblY2Dys=;
        b=iCpncPllezxmh9dfcaffwJdOSwHN2bgSBj10zQGTni7jhXsD0V2WSNfYPzzWcfFLHo
         +BM8jcFBgzlHEfeUIaopuBqmHPod5IwDk41UhaVh+zZH7kEiIfDvbnH5sQtYb9j87Mjc
         D9e6nSqXyxkfTuMUlpn58BonkKsev0zBbh7eTg/z8e3hJf9pz6QgakgG0wxv6BC2H0b9
         0BSL5dmuud88SsEQBVFP+opruoR2u8ghVE+fnY7VgptrBO+QWX9pvv8FkoZl1x/+FU0t
         kktwgEcBreOlF018sSRMxyBZLuBe49fkNcuiKH79Sii7iG6+soT2A3O6wR0mfbc9pNMy
         Jb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735670671; x=1736275471;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rx/BAtYz+YSmLVs6o5kW+gu0D5xRt+OIkNVnblY2Dys=;
        b=LtqX1p+luWP9R+g64M1u80VlXVkTwNuShlT/CEw48O/2wz4UXn1NZCc09sYfICrGse
         rX61iXU67/7jdLkVqd6+L+eQUNN7I1cXVGpIsGmPbsgtnvK5JFpwPgas0EHIg3nsoDZJ
         /z6Ys9ynWEs+e6jGZ7tDqgRSJ0Kpi6WHLR9tKz+vw/lioLGNMx6ClvdFFz2NUvRb6dPZ
         jzTOFCRVRj+Fbdjx9486aPlICo7kpIAkKpErnkLdTkDcY4v3x5i9vgSXDZ3Uo/tXJxLf
         7wOWdoyJA8fEUAN+h7fZ6FLe30KAEDg8rj9mjyQhIAHQknEVxde4GxUCbNw5lh7DVymb
         XzUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsh2X6ZILYnvGtA5cHXP9gnVsJsSHSAEudC552ZpNy39TlLYd0noBMbDOxr4o9PiBizZBg6lxJiuTqssqJQbja@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9z+3QcxOcqr6RHmfkdcVn/j/wHLykM3D+vbnSS5WRmICo/FSb
	5KHNtflMqrVcw0XiEFLzLbDRqazHJgzMf5EoUslp2BACaPtryYhsN+ac9TudcXkaINDLALu6xwI
	CPzOAJTnFLYGWCgx4KWw/U6WG35eqFVhl
X-Gm-Gg: ASbGnct/vsF0n0NdR6Irx0dlZfaxjYMoLe+IYqb2FSxonYVstZQA6uEkEf4BSkhvQI9
	olmNb5zbyIYXAXL3YqemN5bAaTSaPVeD3ldJOALX4RRc2FlITdf+75QsmY1wqKOltm7GUv8w=
X-Google-Smtp-Source: AGHT+IH0eYkv9jMWnNWk5clNdXDiJhTdGXywUxzL8uXyNgWAEqJCW8pgacoyM8OKkm7iaQpFDbJb+dG7SSGKuIkyu6Q=
X-Received: by 2002:a17:903:32c5:b0:215:bb50:6a05 with SMTP id
 d9443c01a7336-219e6e894f4mr583339975ad.9.1735670671350; Tue, 31 Dec 2024
 10:44:31 -0800 (PST)
MIME-Version: 1.0
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 Dec 2024 19:44:20 +0100
Message-ID: <CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com>
Subject: meson-aiu: HDMI codec .prepare() callback not called
To: linux-amlogic@lists.infradead.org, jbrunet@baylibre.com
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Content-Type: multipart/mixed; boundary="000000000000d03d17062a955188"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_104432_635406_C7BADD00 
X-CRM114-Status: GOOD (  17.19  )
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

--000000000000d03d17062a955188
Content-Type: text/plain; charset="UTF-8"

Hi Jerome,

I am still working on a HDMI controller driver for Meson8/8b/8m2.
HDMI output would be incomplete without audio.
There's a great series from Dmitry [0] which simplifies the HDMI
controller driver implementation by moving all the hdmi-codec related
management to a generic framework.

I tried integrating Dmitry's work [0] into my HDMI controller driver.
While testing I found that hdmi-codec's .prepare() callback is not
called at all and asked Dmitry for help [1]. All other callbacks
(.hw_params, .startup, .shutdown, ...) however are called.
On his board (Qualcomm SDM845, sdm845-db845c.dts) hdmi_codec_prepare()
is called by snd_soc_pcm_dai_prepare() (core sound framework, not
platform specific).
However, on my Odroid-C1 this is not happening.

Looking further snd_soc_pcm_dai_prepare() I can see that
for_each_rtd_dais() has three entries:
  snd_soc_pcm_dai_prepare(), dai name=I2S Encoder, id=2
  snd_soc_pcm_dai_prepare(), dai name=CODEC CTRL HDMI I2S IN, id=0
  snd_soc_pcm_dai_prepare(), dai name=I2S FIFO, id=0
What I'm missing here is a dai name "i2s-hifi" (from
sound/soc/codecs/hdmi-codec.c, see hdmi_i2s_dai)

My hdmi_tx node looks like this (abbreviated):
  hdmi_tx: hdmi-tx@42000 {
      compatible = "amlogic,meson8b-hdmi-tx";
      reg = <0x42000 0xc>;
      #sound-dai-cells = <1>;
       ...
  };

Then I have a "amlogic,gx-sound-card" instance with the following dai-links:
  dai-link-0 {
      sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
  };
  dai-link-1 {
      sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
      dai-format = "i2s";
      mclk-fs = <256>;

      codec-0 {
          sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
    };
  };
  dai-link-2 {
      sound-dai = <&aiu AIU_HDMI CTRL_OUT>;

      codec-0 {
          sound-dai = <&hdmi_tx 0>;
      };
  };
So apart from the additional cell in the sound-dai towards hdmi_tx
(Meson8/8b/8m2's HDMI controller has two inputs: I2C and SPDIF. I2C is
the first one, hence &hdmi_tx 0) this is identical to
arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts.

I have further verified that the gx-card parsing does find the HDMi
controller and links it correctly.
To me it's odd that only the .prepare() callback is not called, all
others (as mentioned above: .hw_params, .startup, ...) are working
fine.

I'm not familiar with the sound stack and I'm hoping that you have
some ideas on how to either debug or fix it.


Thanks in advance and best regards,
Martin


[0] https://lore.kernel.org/dri-devel/20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org/
[1] https://lore.kernel.org/dri-devel/20241231004311.2574720-1-martin.blumenstingl@googlemail.com/
[2] https://lore.kernel.org/dri-devel/l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6/

--000000000000d03d17062a955188
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="sound-soc-soc-dai-snd_soc_pcm_dai_prepare-info.diff"
Content-Disposition: attachment; 
	filename="sound-soc-soc-dai-snd_soc_pcm_dai_prepare-info.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m5ctggrg0>
X-Attachment-Id: f_m5ctggrg0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9oZG1pX2F1ZGlvX2hlbHBl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2hkbWlfYXVkaW9faGVscGVyLmMKaW5k
ZXggYWEzYTVkMDMyOWRjLi4wNWFmYzlmMGJkZDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kaXNwbGF5L2RybV9oZG1pX2F1ZGlvX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
aXNwbGF5L2RybV9oZG1pX2F1ZGlvX2hlbHBlci5jCkBAIC0xMjksNyArMTI5LDYgQEAgRVhQT1JU
X1NZTUJPTChkcm1fY29ubmVjdG9yX2hkbWlfYXVkaW9fcGx1Z2dlZF9ub3RpZnkpOwogc3RhdGlj
IGNvbnN0IHN0cnVjdCBoZG1pX2NvZGVjX29wcyBkcm1fY29ubmVjdG9yX2hkbWlfYXVkaW9fb3Bz
ID0gewogCS5hdWRpb19zdGFydHVwID0gZHJtX2Nvbm5lY3Rvcl9oZG1pX2F1ZGlvX3N0YXJ0dXAs
CiAJLnByZXBhcmUgPSBkcm1fY29ubmVjdG9yX2hkbWlfYXVkaW9fcHJlcGFyZSwKLQkuaHdfcGFy
YW1zID0gZHJtX2Nvbm5lY3Rvcl9oZG1pX2F1ZGlvX3ByZXBhcmUsCiAJLmF1ZGlvX3NodXRkb3du
ID0gZHJtX2Nvbm5lY3Rvcl9oZG1pX2F1ZGlvX3NodXRkb3duLAogCS5tdXRlX3N0cmVhbSA9IGRy
bV9jb25uZWN0b3JfaGRtaV9hdWRpb19tdXRlX3N0cmVhbSwKIAkuZ2V0X2VsZCA9IGRybV9jb25u
ZWN0b3JfaGRtaV9hdWRpb19nZXRfZWxkLApkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy9o
ZG1pLWNvZGVjLmMgYi9zb3VuZC9zb2MvY29kZWNzL2hkbWktY29kZWMuYwppbmRleCA2OWY5ODk3
NWUxNGEuLmE5MzFkMDViYTg5ZSAxMDA2NDQKLS0tIGEvc291bmQvc29jL2NvZGVjcy9oZG1pLWNv
ZGVjLmMKKysrIGIvc291bmQvc29jL2NvZGVjcy9oZG1pLWNvZGVjLmMKQEAgLTU3MCwxMyArNTcw
LDEzIEBAIHN0YXRpYyBpbnQgaGRtaV9jb2RlY19od19wYXJhbXMoc3RydWN0IHNuZF9wY21fc3Vi
c3RyZWFtICpzdWJzdHJlYW0sCiAJfTsKIAlpbnQgcmV0OwogCi0JaWYgKCFoY3AtPmhjZC5vcHMt
Pmh3X3BhcmFtcykKLQkJcmV0dXJuIDA7Ci0KLQlkZXZfZGJnKGRhaS0+ZGV2LCAiJXMoKSB3aWR0
aCAlZCByYXRlICVkIGNoYW5uZWxzICVkXG4iLCBfX2Z1bmNfXywKKwlkZXZfaW5mbyhkYWktPmRl
diwgIiVzKCkgd2lkdGggJWQgcmF0ZSAlZCBjaGFubmVscyAlZFxuIiwgX19mdW5jX18sCiAJCXBh
cmFtc193aWR0aChwYXJhbXMpLCBwYXJhbXNfcmF0ZShwYXJhbXMpLAogCQlwYXJhbXNfY2hhbm5l
bHMocGFyYW1zKSk7CiAKKwlpZiAoIWhjcC0+aGNkLm9wcy0+aHdfcGFyYW1zKQorCQlyZXR1cm4g
MDsKKwogCXJldCA9IGhkbWlfY29kZWNfZmlsbF9jb2RlY19wYXJhbXMoZGFpLAogCQkJCQkgICBw
YXJhbXNfd2lkdGgocGFyYW1zKSwKIAkJCQkJICAgcGFyYW1zX3JhdGUocGFyYW1zKSwKQEAgLTYx
MSwxMiArNjExLDEyIEBAIHN0YXRpYyBpbnQgaGRtaV9jb2RlY19wcmVwYXJlKHN0cnVjdCBzbmRf
cGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAogCXN0cnVjdCBoZG1pX2NvZGVjX3BhcmFtcyBocDsK
IAlpbnQgcmV0OwogCisJZGV2X2luZm8oZGFpLT5kZXYsICIlcygpIHdpZHRoICVkIHJhdGUgJWQg
Y2hhbm5lbHMgJWRcbiIsIF9fZnVuY19fLAorCQl3aWR0aCwgcmF0ZSwgY2hhbm5lbHMpOworCiAJ
aWYgKCFoY3AtPmhjZC5vcHMtPnByZXBhcmUpCiAJCXJldHVybiAwOwogCi0JZGV2X2RiZyhkYWkt
PmRldiwgIiVzKCkgd2lkdGggJWQgcmF0ZSAlZCBjaGFubmVscyAlZFxuIiwgX19mdW5jX18sCi0J
CXdpZHRoLCByYXRlLCBjaGFubmVscyk7Ci0KIAlyZXQgPSBoZG1pX2NvZGVjX2ZpbGxfY29kZWNf
cGFyYW1zKGRhaSwgd2lkdGgsIHJhdGUsIGNoYW5uZWxzLCAmaHApOwogCWlmIChyZXQgPCAwKQog
CQlyZXR1cm4gcmV0OwpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvYy1kYWkuYyBiL3NvdW5kL3Nv
Yy9zb2MtZGFpLmMKaW5kZXggMzRiYTFhOTNhNGM5Li4wMzBjNTczNzUzY2MgMTAwNjQ0Ci0tLSBh
L3NvdW5kL3NvYy9zb2MtZGFpLmMKKysrIGIvc291bmQvc29jL3NvYy1kYWkuYwpAQCAtNTc3LDYg
KzU3Nyw3IEBAIGludCBzbmRfc29jX3BjbV9kYWlfcHJlcGFyZShzdHJ1Y3Qgc25kX3BjbV9zdWJz
dHJlYW0gKnN1YnN0cmVhbSkKIAlpbnQgaSwgcmV0OwogCiAJZm9yX2VhY2hfcnRkX2RhaXMocnRk
LCBpLCBkYWkpIHsKKwkJcHJfaW5mbygiJXMoKSwgZGFpIG5hbWU9JXMsIGlkPSVkXG4iLCBfX2Z1
bmNfXywgZGFpLT5uYW1lLCBkYWktPmlkKTsKIAkJaWYgKCFzbmRfc29jX2RhaV9zdHJlYW1fdmFs
aWQoZGFpLCBzdWJzdHJlYW0tPnN0cmVhbSkpCiAJCQljb250aW51ZTsKIAkJaWYgKGRhaS0+ZHJp
dmVyLT5vcHMgJiYK
--000000000000d03d17062a955188--

